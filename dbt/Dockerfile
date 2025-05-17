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
