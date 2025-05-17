// modules/ecr/main.tf
resource "aws_ecr_repository" "airflow" {
  name                 = "estoque-hospitalar-airflow"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "estoque-hospitalar-airflow-ecr"
  }
}

resource "aws_ecr_repository" "dbt" {
  name                 = "estoque-hospitalar-dbt"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "estoque-hospitalar-dbt-ecr"
  }
}

// Criando uma política de vida útil para as imagens para limitar o número de imagens não marcadas
resource "aws_ecr_lifecycle_policy" "airflow_policy" {
  repository = aws_ecr_repository.airflow.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Manter apenas as últimas 10 imagens não marcadas"
      selection = {
        tagStatus     = "untagged"
        countType     = "imageCountMoreThan"
        countNumber   = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}

resource "aws_ecr_lifecycle_policy" "dbt_policy" {
  repository = aws_ecr_repository.dbt.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Manter apenas as últimas 10 imagens não marcadas"
      selection = {
        tagStatus     = "untagged"
        countType     = "imageCountMoreThan"
        countNumber   = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}