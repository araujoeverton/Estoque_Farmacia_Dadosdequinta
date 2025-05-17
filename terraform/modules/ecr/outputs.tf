// modules/ecr/outputs.tf
output "airflow_repository_url" {
  description = "URL do repositório ECR para Airflow"
  value       = aws_ecr_repository.airflow.repository_url
}

output "dbt_repository_url" {
  description = "URL do repositório ECR para DBT"
  value       = aws_ecr_repository.dbt.repository_url
}