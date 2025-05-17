// modules/ecs/outputs.tf
output "cluster_name" {
  description = "Nome do cluster ECS"
  value       = aws_ecs_cluster.main.name
}

output "cluster_arn" {
  description = "ARN do cluster ECS"
  value       = aws_ecs_cluster.main.arn
}

output "airflow_task_definition_arn" {
  description = "ARN da task definition do Airflow"
  value       = aws_ecs_task_definition.airflow.arn
}

output "dbt_task_definition_arn" {
  description = "ARN da task definition do DBT"
  value       = aws_ecs_task_definition.dbt.arn
}

output "airflow_alb_dns" {
  description = "DNS do Application Load Balancer para acessar o Airflow"
  value       = aws_lb.airflow.dns_name
}