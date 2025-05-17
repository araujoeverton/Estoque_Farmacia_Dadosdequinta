// modules/security_groups/outputs.tf
output "ecs_security_group_id" {
  description = "ID do security group para o ECS"
  value       = aws_security_group.ecs.id
}

output "rds_security_group_id" {
  description = "ID do security group para o RDS"
  value       = aws_security_group.rds.id
}