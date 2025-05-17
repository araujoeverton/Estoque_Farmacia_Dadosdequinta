// Arquivo principal: main.tf
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ecr" {
  source = "./modules/ecr"
}

module "s3" {
  source = "./modules/s3"
}

module "rds" {
  source              = "./modules/rds"
  vpc_id              = module.vpc.vpc_id
  private_subnets     = module.vpc.private_subnets
  security_group_id   = module.security_groups.rds_security_group_id
}

module "ecs" {
  source                = "./modules/ecs"
  vpc_id                = module.vpc.vpc_id
  private_subnets       = module.vpc.private_subnets
  public_subnets        = module.vpc.public_subnets
  security_group_id     = module.security_groups.ecs_security_group_id
  airflow_repository_url = module.ecr.airflow_repository_url
  dbt_repository_url    = module.ecr.dbt_repository_url
  rds_endpoint          = module.rds.rds_endpoint
  
  depends_on = [module.rds, module.ecr]
}

// Outputs
output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.vpc.vpc_id
}

output "ecr_airflow_repository_url" {
  description = "URL do repositório ECR para Airflow"
  value       = module.ecr.airflow_repository_url
}

output "ecr_dbt_repository_url" {
  description = "URL do repositório ECR para DBT"
  value       = module.ecr.dbt_repository_url
}

output "ecs_cluster_name" {
  description = "Nome do cluster ECS"
  value       = module.ecs.cluster_name
}

output "airflow_alb_dns" {
  description = "DNS do Application Load Balancer para acessar o Airflow"
  value       = module.ecs.airflow_alb_dns
}

output "s3_bucket_name" {
  description = "Nome do bucket S3 para o datalake"
  value       = module.s3.bucket_name
}

output "rds_endpoint" {
  description = "Endpoint do RDS MySQL"
  value       = module.rds.rds_endpoint
}