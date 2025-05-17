// modules/rds/variables.tf
variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "private_subnets" {
  description = "IDs das subnets privadas"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID do security group para o RDS"
  type        = string
}