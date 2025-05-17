// modules/rds/outputs.tf
output "rds_endpoint" {
  description = "Endpoint do RDS MySQL"
  value       = aws_db_instance.main.endpoint
}

output "rds_name" {
  description = "Nome do banco de dados RDS"
  value       = aws_db_instance.main.db_name
}

output "rds_username" {
  description = "Nome de usuário do RDS"
  value       = aws_db_instance.main.username
}