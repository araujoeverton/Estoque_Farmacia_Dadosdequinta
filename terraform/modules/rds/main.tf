// modules/rds/main.tf
resource "aws_db_subnet_group" "main" {
  name       = "estoque-hospitalar-db-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "Estoque Hospitalar DB Subnet Group"
  }
}

resource "aws_db_parameter_group" "main" {
  name   = "estoque-hospitalar-mysql"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_instance" "main" {
  identifier           = "estoque-hospitalar-mysql"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.small"
  allocated_storage    = 20
  max_allocated_storage = 100
  storage_type         = "gp2"
  storage_encrypted    = true
  
  db_name              = "estoquehospitalar"
  username             = "admin"
  password             = "Senha123!" # Em produção, use o aws_ssm_parameter para armazenar senhas de forma segura
  
  parameter_group_name = aws_db_parameter_group.main.name
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.security_group_id]
  
  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "Mon:04:00-Mon:05:00"
  
  skip_final_snapshot     = true
  deletion_protection     = false

  tags = {
    Name = "estoque-hospitalar-mysql"
  }
}