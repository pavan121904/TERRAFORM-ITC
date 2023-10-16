variable "name_prefix" {
  description = "A prefix for naming resources"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type for the Auto Scaling Group"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "The ID of the AMI to use for the EC2 instances"
  type        = string
}

variable "min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
  default     = 4
}

variable "desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "vpc_id" {
  description = "The ID of the VPC where the ALB and EC2 instances will be launched"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the ALB and EC2 instances will be launched"
  type        = list(string)
}
