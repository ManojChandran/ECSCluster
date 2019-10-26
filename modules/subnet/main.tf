data "aws_subnet_ids" "example" {
  vpc_id = "${var.vpc_id}"
}

output "subnet_cidr_blocks" {
  value = ["${data.aws_subnet_ids.example.*.ids}"]
}
