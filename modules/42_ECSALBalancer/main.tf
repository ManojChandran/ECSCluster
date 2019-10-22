#----42_ECSALBalancer/main.tf-----

data "aws_subnet_ids" "selected" {
  vpc_id = "${var.vpc_id}"
  filter {
    name   = "tag:Name"
    values = ["tf_private_*"]       # insert values here
  }
}

resource "aws_alb" "tf_ecs-load-balancer" {
  count = "${length(data.aws_subnet_ids.selected.ids)}"
  name  = "ecs-load-balancer"
#    security_groups     = ["${aws_security_group.test_public_sg.id}"]
  subnets             =  ["${data.aws_subnet_ids.selected.*.ids}"]

    tags {
      Name = "ecs-load-balancer"
    }
}
