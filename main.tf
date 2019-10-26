#----root/main.tf-----

provider "aws" {
  region = "${var.aws_region}"
}

resource "null_resource" "cluster" {
  module "subnet" {
    source = "./modules/subnet"
    vpc_id = "${var.vpc_id}"
  }
}
