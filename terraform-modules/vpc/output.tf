output "vpc_id"{
    value = aws_vpc.main.id
}
output "public_subnet_ids" {
  value = data.aws_subnet_ids.public_subnets.ids
}