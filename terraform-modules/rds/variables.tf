variable "db_name" {
  description = "The name of the database."
  type        = string
}

variable "db_instance_identifier" {
  description = "A unique identifier for the database instance."
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance."
  type        = string
  default     = "db.t2.micro"
}

variable "engine" {
  description = "The name of the database engine to be used for this DB instance."
  type        = string
  default     = "mysql"
}

variable "allocated_storage" {
  description = "The amount of allocated storage in gibibytes."
  type        = number
  default     = 20
}

variable "username" {
  description = "The master username for the database."
  type        = string
}

variable "password" {
  description = "The master password for the database."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security group IDs to associate with the RDS instance."
  type        = list(string)
}
variable "private_subnet_ids" {
  description = "A list of private subnet IDs where the RDS instance will be launched."
  type        = list(string)
}
