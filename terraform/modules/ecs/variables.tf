// modules/ecs/variables.tf
variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "private_subnets" {
  description = "IDs das subnets privadas"
  type        = list(string)
}

variable "public_subnets" {
  description = "IDs das subnets públicas"
  type        = list(string)
  default     = []
}

variable "security_group_id" {
  description = "ID do security group para o ECS"
  type        = string
}

variable "airflow_repository_url" {
  description = "URL do repositório ECR para Airflow"
  type        = string
}

variable "dbt_repository_url" {
  description = "URL do repositório ECR para DBT"
  type        = string
}

variable "rds_endpoint" {
  description = "Endpoint do RDS MySQL"
  type        = string
}