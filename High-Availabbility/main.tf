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
