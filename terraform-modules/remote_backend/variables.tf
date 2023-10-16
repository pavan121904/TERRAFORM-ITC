variable "bucket_name" {
  description = "The name of the S3 bucket to store the Terraform state file."
  type        = string
}

variable "dynamodb_table" {
  description = "The name of the DynamoDB table to use for state locking."
  type        = string
}

variable "region" {
  description = "The AWS region in which to create the S3 bucket and DynamoDB table."
  type        = string
}
