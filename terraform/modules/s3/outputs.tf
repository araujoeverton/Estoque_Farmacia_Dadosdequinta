// modules/s3/outputs.tf
output "bucket_name" {
  description = "Nome do bucket S3 para o datalake"
  value       = aws_s3_bucket.datalake.id
}

output "bucket_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.datalake.arn
}