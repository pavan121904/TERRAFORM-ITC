provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "backend_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "aws_dynamodb_table" "backend_locking_table" {
  name           = var.dynamodb_table
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
