output "backend_config" {
  description = "The configuration for the remote backend."
  value = {
    s3_bucket_name     = aws_s3_bucket.backend_bucket.id,
    dynamodb_table     = aws_dynamodb_table.backend_locking_table.name,
    s3_region          = var.region
  }
}
