module "vpc"{
    source = "../../terraform-modules/vpc"
    tags = var.tags
    igw_tags = var.igw_tags
    public_subnet_tags = var.public_subnet_tags
    private_subnet_tags = var.private_subnet_tags
    public_route_table_tags = var.public_route_table_tags
    private_route_table_tags = var.private_route_table_tags
    database_subnet_tags = var.database_subnet_tags
}
module "ec2_instance" {
  source        = "./ec2-instance"
  instance_type = "t2.micro"
  ami           = "ami-0ea7dc624e77a15d5"  # Replace with your desired AMI ID
  vpc_id        = "your-vpc-id"
  subnet_ids    = ["subnet-id-1", "subnet-id-2"]  # Specify your public subnets
  security_group_name = "my-ec2-sg"
}

module "auto_scaling" {
  source        = "./auto-scaling"
  min_size      = 2
  max_size      = 4
  desired_capacity = 2
  instance_type = "t2.micro"
  ami           = "ami-0ea7dc624e77a15d5"  # Replace with your desired AMI ID
  vpc_id        = "your-vpc-id"
  subnet_ids    = ["subnet-id-1", "subnet-id-2"]  # Specify your public subnets
  security_group_name = "my-ec2-sg"
}

