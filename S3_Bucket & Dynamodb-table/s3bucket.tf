resource "aws_s3_bucket" "s3bucket" {
  bucket = "remote-bucket-121904"

  tags = {
    Name        = "remote-bucket-121904"
    
  }
}