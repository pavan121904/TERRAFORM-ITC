resource "aws_vpc" "main" { #this name belongs to only terraform reference

    cidr_block       = local.cidr
    instance_tenancy = "default"
    tags = var.tags
    
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id # internet gateway depends on VPC
  tags = var.igw_tags
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id # it will fetch VPC ID created from above code
  cidr_block = "10.0.2.0/24"

  tags = var.public_subnet_tags
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id # it will fetch VPC ID created from above code
  cidr_block = "10.0.2.0/24"

  tags = var.private_subnet_tags
}
resource "aws_subnet" "database" {
  vpc_id     = aws_vpc.main.id # it will fetch VPC ID created from above code
  cidr_block = "10.0.3.0/24"

  tags = var.database_subnet_tags
}
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.automated-igw.id
  }

  tags = var.public_route_table_tags
}
resource "aws_eip" "eip" {

}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.id

  tags = var.nat_tags

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}
resource "aws_route_table" "private-rt" { #for private route we don't attach IGW, we attach NAT
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.example.id
  }

  tags = var.private_route_table_tags
}
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "database" {
  subnet_id      = aws_subnet.database.id
  route_table_id = aws_route_table.private-rt.id
}

