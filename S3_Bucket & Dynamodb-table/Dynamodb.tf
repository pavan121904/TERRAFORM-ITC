resource "aws_dynamodb_table" "dynamodb" {
  name = "dynamodb-lock"
  hash_key = "LockID"
  billing_mode     = "PAY_PER_REQUEST"
 
  attribute {
    name = "LockID"
    type = "S"
  }
}