#variable "cidr"{
#    type = string
#     cidr = "10.0.0.0/16"
#  } 

variable "tags"{
    type = map
    default = {
        Name= "vpc"
    }
}
variable "igw_tags"{
    type = map
    default = {
        Name= "igw"
    }
}
variable "public_subnet_tags"{
    type = map
    default = {
        Name = Public-subnet
    }
}
variable "private_subnet_tags"{
    type = map
    default = {
        Name = private-subnet
    }

}
variable "public_route_table_tags"{
    type = map
    default = {
        Name = public_rt
    }
}
variable "nat_tags"{
    type = map
    default = {
        Name = nat_gateway
    }
}
variable "private_route_table_tags"{
    type = map
    default = {
        Name = private_route_table
    }

}
variable "database_subnet_tags"{
     type = map
    default = {
        Name = database_subnet
    }

}