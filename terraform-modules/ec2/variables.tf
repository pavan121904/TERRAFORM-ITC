variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "The ID of the AMI to use for the EC2 instance"
  type        = string

}

variable "security_group_name" {
  description = "Name of the security group to associate with the EC2 instance"
  type        = string
}
