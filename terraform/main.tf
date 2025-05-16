# main.tf - Arquivo principal que orquestra todos os módulos

# Configuração dos módulos necessários para implementação do MWAA e dbt

module "networking" {
  source = "./modules/networking"

  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  enable_nat_gateway   = true
  single_nat_gateway   = false  # Para HA, usamos múltiplos NAT gateways
  enable_vpn_gateway   = false
  
  tags = var.tags
}

module "s3" {
  source = "./modules/s3"

  environment             = var.environment
  airflow_bucket_name     = var.airflow_bucket_name
  dags_folder             = var.dags_folder
  logs_folder             = var.logs_folder
  plugins_folder          = var.plugins_folder
  requirements_file_path  = var.requirements_file_path
  
  tags = var.tags
}

module "rds" {
  source = "./modules/rds"

  environment           = var.environment
  vpc_id                = module.networking.vpc_id
  private_subnet_ids    = module.networking.private_subnet_ids
  db_instance_class     = var.db_instance_class
  db_engine             = "postgres"
  db_engine_version     = var.db_engine_version
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  multi_az              = true  # Habilita Multi-AZ para alta disponibilidade
  backup_retention_period = 7   # Dias de retenção do backup
  backup_window         = "03:00-04:00"
  maintenance_window    = "mon:04:00-mon:06:00"
  storage_encrypted     = true
  deletion_protection   = true
  enable_performance_insights = true
  
  tags = var.tags
}

module "mwaa" {
  source = "./modules/mwaa"

  environment           = var.environment
  vpc_id                = module.networking.vpc_id
  private_subnet_ids    = module.networking.private_subnet_ids
  public_subnet_ids     = module.networking.public_subnet_ids
  airflow_version       = var.airflow_version
  
  # Configurações de Alta Disponibilidade
  environment_class     = var.environment_class  # Ex: mw1.large para cargas maiores
  max_workers           = var.max_workers
  min_workers           = var.min_workers
  webserver_access_mode = "PUBLIC_ONLY"  # ou PRIVATE_ONLY se preferir VPN/Direct Connect
  
  # Configuração do Executor
  airflow_executor      = "CELERY_KUBERNETES"  # Kubernetes Executor conforme solicitado
  
  # S3 para armazenamento de DAGs e logs
  s3_bucket_arn         = module.s3.airflow_bucket_arn
  dag_s3_path           = var.dags_folder
  plugins_s3_path       = var.plugins_folder
  requirements_s3_path  = "${var.requirements_file_path}/requirements.txt"
  
  # Configuração da base de dados
  database_host         = module.rds.db_instance_address
  database_port         = module.rds.db_instance_port
  database_name         = module.rds.db_instance_name
  database_username     = module.rds.db_instance_username
  database_password     = module.rds.db_instance_password
  
  # Configuração de alta disponibilidade para Web Server
  webserver_instance_count = 2  # Número de instâncias do webserver
  
  # ALB para balanceamento de carga do Web Server
  create_alb            = true
  alb_security_groups   = [module.mwaa.airflow_security_group_id]
  
  # Configurações gerais
  airflow_configuration_options = {
    "core.default_timezone" : "America/Sao_Paulo",
    "scheduler.min_file_process_interval" : "30",
    "webserver.dag_default_view" : "tree",
    "webserver.dag_orientation" : "TB",
    "logging.logging_level" : "INFO",
  }
  
  # Integrações com outros serviços AWS
  kms_key_arn           = var.kms_key_arn
  
  tags = var.tags
  
  depends_on = [
    module.networking,
    module.s3,
    module.rds
  ]
}

module "dbt" {
  source = "./modules/dbt"

  environment      = var.environment
  vpc_id           = module.networking.vpc_id
  subnet_ids       = module.networking.private_subnet_ids
  airflow_bucket   = module.s3.airflow_bucket_name
  dbt_version      = var.dbt_version
  profile_folder   = var.dbt_profile_folder
  project_folder   = var.dbt_project_folder
  
  tags = var.tags
  
  depends_on = [
    module.networking,
    module.s3
  ]
}

module "monitoring" {
  source = "./modules/monitoring"

  environment         = var.environment
  mwaa_environment_name = module.mwaa.airflow_environment_name
  rds_instance_id    = module.rds.db_instance_id
  alarm_email        = var.alarm_email
  
  # Configurações de alarme
  cpu_threshold      = 80
  memory_threshold   = 80
  disk_threshold     = 80
  task_queue_threshold = 100
  
  # Auto-scaling para workers
  enable_autoscaling = true
  
  tags = var.tags
  
  depends_on = [
    module.mwaa,
    module.rds
  ]
}