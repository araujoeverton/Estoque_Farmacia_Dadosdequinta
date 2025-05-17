// modules/ecs/main.tf
resource "aws_ecs_cluster" "main" {
  name = "estoque-hospitalar-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name = "estoque-hospitalar-ecs-cluster"
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "estoque-hospitalar-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "ecs_task_role" {
  name = "estoque-hospitalar-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access" {
  name        = "estoque-hospitalar-s3-access"
  description = "Permite acesso ao bucket S3 do datalake"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::estoquehospitalar",
          "arn:aws:s3:::estoquehospitalar/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3_access_attachment" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.s3_access.arn
}

// Task Definition para o Airflow
resource "aws_ecs_task_definition" "airflow" {
  family                   = "estoque-hospitalar-airflow"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "2048"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "airflow"
      image     = "${var.airflow_repository_url}:latest"
      essential = true
      environment = [
        {
          name  = "AIRFLOW__CORE__EXECUTOR"
          value = "LocalExecutor"
        },
        {
          name  = "AIRFLOW__DATABASE__SQL_ALCHEMY_CONN"
          value = "mysql://admin:Senha123!@${var.rds_endpoint}/airflow"
        }
      ]
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/estoque-hospitalar-airflow"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "airflow"
        }
      }
    }
  ])

  tags = {
    Name = "estoque-hospitalar-airflow-task"
  }
}

// Task definition para o DBT
resource "aws_ecs_task_definition" "dbt" {
  family                   = "estoque-hospitalar-dbt"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "2048"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "dbt"
      image     = "${var.dbt_repository_url}:latest"
      essential = true
      environment = [
        {
          name  = "DBT_PROFILES_DIR"
          value = "/dbt"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/estoque-hospitalar-dbt"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "dbt"
        }
      }
    }
  ])

  tags = {
    Name = "estoque-hospitalar-dbt-task"
  }
}

// Criando os logs groups para o Airflow e DBT
resource "aws_cloudwatch_log_group" "airflow" {
  name              = "/ecs/estoque-hospitalar-airflow"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "dbt" {
  name              = "/ecs/estoque-hospitalar-dbt"
  retention_in_days = 30
}

// Criando um Application Load Balancer para acessar o Airflow
resource "aws_lb" "airflow" {
  name               = "estoque-hospitalar-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.public_subnets

  enable_deletion_protection = false

  tags = {
    Name = "estoque-hospitalar-airflow-alb"
  }
}

resource "aws_lb_target_group" "airflow" {
  name        = "estoque-hospitalar-target-group"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/health"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    matcher             = "200"
  }
}

resource "aws_lb_listener" "airflow" {
  load_balancer_arn = aws_lb.airflow.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.airflow.arn
  }
}

// Configurando o serviço para usar o Application Load Balancer
resource "aws_ecs_service" "airflow" {
  name            = "airflow"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.airflow.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnets
    security_groups  = [var.security_group_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.airflow.arn
    container_name   = "airflow"
    container_port   = 8080
  }

  depends_on = [aws_lb_listener.airflow]

  tags = {
    Name = "estoque-hospitalar-airflow-service"
  }
}