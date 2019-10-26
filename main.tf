
module "subnet" {
  source = "./modules/subnet"
  vpc_id = "${var.vpc_id}"
}
