
resource "aws_db_instance" "rds_database" {
  allocated_storage    = var.allocated_storage
  storage_type         = "gp2"
  engine               = var.engine
  engine_version       = "5.7"
  instance_class       = var.db_instance_class
  name                 = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = var.vpc_security_group_ids
}
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "my-rds-subnet-group"
  subnet_ids = var.private_subnet_ids
}