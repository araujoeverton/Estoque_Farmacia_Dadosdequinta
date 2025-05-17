// modules/s3/main.tf
resource "aws_s3_bucket" "datalake" {
  bucket = "estoquehospitalar"

  tags = {
    Name = "Datalake Estoque Hospitalar"
  }
}

// Configurando versão do bucket
resource "aws_s3_bucket_versioning" "datalake" {
  bucket = aws_s3_bucket.datalake.id
  versioning_configuration {
    status = "Enabled"
  }
}

// Configurando criptografia do bucket por padrão
resource "aws_s3_bucket_server_side_encryption_configuration" "datalake" {
  bucket = aws_s3_bucket.datalake.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

// Bloqueando acesso público ao bucket
resource "aws_s3_bucket_public_access_block" "datalake" {
  bucket                  = aws_s3_bucket.datalake.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

// Criando a estrutura de pastas no datalake
resource "aws_s3_object" "bronze" {
  bucket  = aws_s3_bucket.datalake.id
  key     = "bronze/"
  content_type = "application/x-directory"
}

resource "aws_s3_object" "silver" {
  bucket  = aws_s3_bucket.datalake.id
  key     = "silver/"
  content_type = "application/x-directory"
}

resource "aws_s3_object" "gold" {
  bucket  = aws_s3_bucket.datalake.id
  key     = "gold/"
  content_type = "application/x-directory"
}