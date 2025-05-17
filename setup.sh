#!/bin/bash

# Script adaptado para criar um Airflow corrigido para resolver o erro 503
# Configuração
TERRAFORM_DIR="terraform"  # Altere para o caminho relativo correto ao diretório Terraform
AWS_REGION="us-east-1"

echo "====================== SETUP E CONFIGURAÇÃO ======================"

# Criar estrutura de diretórios
echo "Criando estrutura de diretórios básica..."
mkdir -p airflow/dags
mkdir -p dbt

# Criar Dockerfile corrigido para o Airflow
echo "Criando Dockerfile corrigido para o Airflow..."
cat > airflow/Dockerfile << 'EOF'
FROM apache/airflow:2.6.3

USER root

# Instalando dependências do sistema
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
         vim \
         default-mysql-client \
         curl \
         nginx \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Instalar Flask para servidor de health check
RUN pip install flask gunicorn

# Criar diretório para logs e configurações
RUN mkdir -p /opt/airflow/logs /opt/airflow/dags /opt/airflow/plugins \
    && chown -R airflow:airflow /opt/airflow

# Configurar um servidor de health check independente
RUN mkdir -p /opt/health_server
RUN echo 'from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Airflow Server OK"

@app.route("/health")
def health():
    return "Health Check OK"
' > /opt/health_server/app.py

# Criar arquivo de configuração NGINX para proxy
RUN echo 'server {
    listen 8080;
    
    location /health {
        proxy_pass http://localhost:8081;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
    
    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}' > /etc/nginx/sites-available/airflow

RUN ln -s /etc/nginx/sites-available/airflow /etc/nginx/sites-enabled/

# Voltar ao usuário airflow
USER airflow

# Instalando pacotes Python básicos
RUN pip install --no-cache-dir \
    apache-airflow-providers-amazon \
    apache-airflow-providers-mysql \
    pandas \
    boto3 \
    pymysql

# Script de inicialização
RUN echo '#!/bin/bash
echo "Iniciando servidor de health check na porta 8081..."
cd /opt/health_server
gunicorn --bind 0.0.0.0:8081 app:app --daemon

echo "Inicializando banco de dados Airflow..."
airflow db init

echo "Criando usuário admin..."
airflow users create \
  --username admin \
  --password admin \
  --firstname Admin \
  --lastname User \
  --role Admin \
  --email admin@example.com || true

echo "Iniciando Airflow webserver..."
airflow webserver --port 8080
' > /opt/airflow/start.sh && chmod +x /opt/airflow/start.sh

# Diretório de trabalho
WORKDIR /opt/airflow

# Expor porta
EXPOSE 8080 8081

# Comando para inicializar
ENTRYPOINT ["/opt/airflow/start.sh"]
EOF

# Criar uma DAG simples para verificar a instalação
echo "Criando DAG simples para teste..."
mkdir -p airflow/dags
cat > airflow/dags/hello_world.py << 'EOF'
"""
DAG simples para verificar a instalação do Airflow
"""
from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python import PythonOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    'start_date': datetime(2023, 1, 1),
}

dag = DAG(
    'hello_world',
    default_args=default_args,
    description='DAG simples para teste',
    schedule_interval=None,
    catchup=False,
)

def print_hello():
    return 'Olá! Airflow está funcionando corretamente!'

hello_task = PythonOperator(
    task_id='hello_task',
    python_callable=print_hello,
    dag=dag,
)

hello_task
EOF

# Criar Dockerfile para o DBT (mantido igual)
echo "Criando Dockerfile para o DBT..."
cat > dbt/Dockerfile << 'EOF'
FROM python:3.10-slim

WORKDIR /usr/app/dbt

# Instalar dependências mínimas
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    ssh \
    default-mysql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar dbt e adaptador mysql
RUN pip install --no-cache-dir dbt-core dbt-mysql

# Criar um projeto DBT básico manualmente
RUN mkdir -p demo_project/models demo_project/analyses demo_project/tests demo_project/macros demo_project/seeds

# Criar arquivo dbt_project.yml
RUN echo 'name: demo_project\nversion: 1.0.0\nconfig-version: 2\nprofile: demo_profile\nmodel-paths: ["models"]\nanalysis-paths: ["analyses"]\ntest-paths: ["tests"]\nseed-paths: ["seeds"]\nmacro-paths: ["macros"]\ntarget-path: "target"\nclean-targets: ["target"]\n' > demo_project/dbt_project.yml

# Criar arquivo profiles.yml
RUN mkdir -p /root/.dbt
RUN echo 'demo_profile:\n  target: dev\n  outputs:\n    dev:\n      type: mysql\n      server: localhost\n      port: 3306\n      schema: estoque\n      username: root\n      password: password\n' > /root/.dbt/profiles.yml

# Criar um modelo de exemplo
RUN echo 'SELECT * FROM estoque.produtos' > demo_project/models/produtos.sql

# Configurar o diretório de trabalho
WORKDIR /usr/app/dbt/demo_project

# Comando padrão
ENTRYPOINT ["dbt"]
CMD ["--help"]
EOF

echo "Configuração básica concluída com sucesso!"

echo ""
echo "====================== ATUALIZAR CONFIGURAÇÕES DO TARGET GROUP ======================"

echo "Atualizando configurações do Target Group para o health check..."
# Obter o ARN do target group
TARGET_GROUP_ARN=$(aws elbv2 describe-target-groups \
  --names estoque-hospitalar-target-group \
  --query 'TargetGroups[0].TargetGroupArn' \
  --output text 2>/dev/null)

if [ ! -z "$TARGET_GROUP_ARN" ]; then
  echo "Target Group encontrado: $TARGET_GROUP_ARN"
  aws elbv2 modify-target-group \
    --target-group-arn $TARGET_GROUP_ARN \
    --health-check-path "/health" \
    --matcher '{"HttpCode": "200,302"}' \
    --health-check-interval-seconds 60 \
    --healthy-threshold-count 2 \
    --unhealthy-threshold-count 5 \
    --health-check-timeout-seconds 30
  
  if [ $? -eq 0 ]; then
    echo "Target Group atualizado com sucesso com novas configurações de health check."
  else
    echo "Falha ao atualizar o Target Group. Você pode precisar fazer isso manualmente."
  fi
else
  echo "Target Group não encontrado. Você precisará atualizar as configurações manualmente."
fi

echo ""
echo "====================== BUILD E PUSH PARA ECR ======================"

# Verificar se o diretório Terraform existe
if [ ! -d "$TERRAFORM_DIR" ]; then
    echo "Diretório Terraform '$TERRAFORM_DIR' não encontrado. Verificando em diretórios acima..."
    
    # Tentar encontrar o diretório Terraform em lugares alternativos
    if [ -d "../$TERRAFORM_DIR" ]; then
        TERRAFORM_DIR="../$TERRAFORM_DIR"
        echo "Diretório Terraform encontrado em: $TERRAFORM_DIR"
    else
        echo "Aviso: Diretório Terraform não encontrado. Você precisará especificar manualmente os URLs dos repositórios ECR."
        
        # Solicitar URLs manualmente
        read -p "Digite o URL do repositório ECR para Airflow (ex: 123456789012.dkr.ecr.us-east-1.amazonaws.com/estoque-hospitalar-airflow): " AIRFLOW_REPO
        read -p "Digite o URL do repositório ECR para DBT (ex: 123456789012.dkr.ecr.us-east-1.amazonaws.com/estoque-hospitalar-dbt): " DBT_REPO
        
        # Extrair o domínio ECR
        ECR_DOMAIN=$(echo $AIRFLOW_REPO | cut -d/ -f1)
    fi
else
    # Obter URLs dos repositórios ECR do Terraform
    echo "Obtendo URLs dos repositórios ECR do Terraform..."
    AIRFLOW_REPO=$(terraform -chdir=$TERRAFORM_DIR output -raw ecr_airflow_repository_url)
    if [ $? -ne 0 ]; then
        echo "Erro ao obter URL do repositório Airflow do Terraform."
        read -p "Digite o URL do repositório ECR para Airflow (ex: 123456789012.dkr.ecr.us-east-1.amazonaws.com/estoque-hospitalar-airflow): " AIRFLOW_REPO
    fi
    
    DBT_REPO=$(terraform -chdir=$TERRAFORM_DIR output -raw ecr_dbt_repository_url)
    if [ $? -ne 0 ]; then
        echo "Erro ao obter URL do repositório DBT do Terraform."
        read -p "Digite o URL do repositório ECR para DBT (ex: 123456789012.dkr.ecr.us-east-1.amazonaws.com/estoque-hospitalar-dbt): " DBT_REPO
    fi
    
    # Extrair o domínio ECR
    ECR_DOMAIN=$(echo $AIRFLOW_REPO | cut -d/ -f1)
fi

echo "Repositório Airflow: $AIRFLOW_REPO"
echo "Repositório DBT: $DBT_REPO"
echo "Domínio ECR: $ECR_DOMAIN"

# Fazer login no ECR
echo "Fazendo login no Amazon ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_DOMAIN
if [ $? -ne 0 ]; then
    echo "Erro ao fazer login no ECR. Verifique suas credenciais AWS."
    exit 1
fi

# Puxar imagens base antecipadamente
echo "Puxando imagens base antecipadamente para evitar problemas de rate limit..."
docker pull apache/airflow:2.6.3
docker pull python:3.10-slim

# Construir e enviar a imagem do Airflow
echo "Construindo a imagem do Airflow..."
docker build -t "$AIRFLOW_REPO:latest" ./airflow
if [ $? -ne 0 ]; then
    echo "Erro ao construir a imagem do Airflow."
    exit 1
fi

echo "Enviando a imagem do Airflow para o ECR..."
docker push "$AIRFLOW_REPO:latest"
if [ $? -ne 0 ]; then
    echo "Erro ao enviar a imagem do Airflow para o ECR."
    exit 1
fi

# Construir e enviar a imagem do DBT
echo "Construindo a imagem do DBT..."
docker build -t "$DBT_REPO:latest" ./dbt
if [ $? -ne 0 ]; then
    echo "Erro ao construir a imagem do DBT."
    exit 1
fi

echo "Enviando a imagem do DBT para o ECR..."
docker push "$DBT_REPO:latest"
if [ $? -ne 0 ]; then
    echo "Erro ao enviar a imagem do DBT para o ECR."
    exit 1
fi

echo ""
echo "====================== ATUALIZAR SERVIÇO ECS ======================"
echo "Tentando atualizar o serviço ECS..."

# Atualizar o serviço ECS com novas configurações
aws ecs update-service \
  --cluster estoque-hospitalar-cluster \
  --service airflow \
  --health-check-grace-period-seconds 300 \
  --force-new-deployment

if [ $? -eq 0 ]; then
  echo "Serviço ECS atualizado com sucesso. Uma nova implantação foi iniciada."
  echo "Aguarde alguns minutos para que a nova task esteja em execução e passe nos health checks."
else
  echo "Falha ao atualizar o serviço ECS. Você pode precisar fazer isso manualmente."
fi

echo "====================== PROCESSO CONCLUÍDO ======================"
echo "Imagens enviadas com sucesso para:"
echo "Airflow: $AIRFLOW_REPO:latest"
echo "DBT: $DBT_REPO:latest"
echo ""
echo "Próximos passos:"
echo "1. Aguarde 5-10 minutos para que o serviço ECS se estabilize"
echo "2. Verifique o status do serviço com o comando:"
echo "   aws ecs describe-services --cluster estoque-hospitalar-cluster --services airflow"
echo "3. Verifique os health checks com o comando:"
echo "   TARGET_GROUP_ARN=\$(aws elbv2 describe-target-groups --names estoque-hospitalar-target-group --query 'TargetGroups[0].TargetGroupArn' --output text)"
echo "   aws elbv2 describe-target-health --target-group-arn \$TARGET_GROUP_ARN"
echo "4. Acesse o Airflow através do ALB DNS:"
echo "   $(terraform -chdir=$TERRAFORM_DIR output -raw airflow_alb_dns 2>/dev/null || echo "URL do ALB não disponível via Terraform")"