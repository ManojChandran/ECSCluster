#-------------------10_networking/main.tf-----------------------------------

# Deploy VPC and attach IGW
module "vpc_igw" {
  source       = "./modules/10_VPC_igw"
  vpc_cidr     = "${var.vpc_cidr}"
}

# Deploy Public Subnet and Route tables
module "PublicSubnet" {
  source       = "./modules/11_PublicSubnet"
  vpc_id       = "${module.vpc_igw.vpc_id}"
  vpc_igw_id   = "${module.vpc_igw.igw_id}"
#  vpc_route_table_id      = "${module.vpc_igw.default_route_table_id}"
  vpc_public_subnet_count = "${var.vpc_public_subnet_count}"
  vpc_public_cidrs        = "${var.vpc_public_cidrs}"
}

# Deploy Private Subnet and Route tables
module "PrivateSubnet" {
  source       = "./modules/12_PrivateSubnet"
  vpc_id       = "${module.vpc_igw.vpc_id}"
#  vpc_igw_id   = "${module.vpc_igw.igw_id}"
  vpc_route_table_id       = "${module.vpc_igw.default_route_table_id}"
  vpc_private_subnet_count = "${var.vpc_private_subnet_count}"
  vpc_private_cidrs        = "${var.vpc_private_cidrs}"
}

# Deploy RDS Subnet and Route tables
module "RDSSubnet" {
  source       = "./modules/13_RDSSubnet"
  vpc_id       = "${module.vpc_igw.vpc_id}"
  vpc_rds_subnet_count = "${var.vpc_rds_subnet_count}"
  vpc_rds_cidrs        = "${var.vpc_rds_cidrs}"
}

# Deploy VPC flowlogs
module "Flowlogs" {
  source       = "./modules/20_Flowlogs"
  vpc_id       = "${module.vpc_igw.vpc_id}"
}

module "applloadbalancer" {
  source       = "./modules/14_ALBalancer"
  vpc_id       = "${module.vpc_igw.vpc_id}"
  private_subnets_alb      = "${module.PrivateSubnet.vpc_private_subnets}"
}
