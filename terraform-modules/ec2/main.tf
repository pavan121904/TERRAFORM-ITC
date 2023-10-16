
resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "Name_of_Ec2"
  }
}

resource "aws_security_group" "ec2_security_group" {
  name        = var.security_group_name
  description = "Security Group for EC2 instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow TLS inbound traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}
