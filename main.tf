#----root/main.tf-----

provider "aws" {
  region = "${var.aws_region}"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = "${var.vpc_id}"
}
