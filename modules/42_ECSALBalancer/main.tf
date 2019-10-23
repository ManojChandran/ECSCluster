#----42_ECSALBalancer/main.tf-----

data "aws_subnet_ids" "selected" {
  vpc_id = "${var.vpc_id}"
  filter {
    name   = "tag:Name"
    values = ["tf_private_1", "tf_private_2", "tf_private_3", "tf_private_4", "tf_private_5"]
  }
}

resource "aws_alb" "tf_ecs-load-balancer" {
  name  = "ecs-load-balancer"
#  security_groups     = ["${aws_security_group.test_public_sg.id}"]
  subnets             =  ["${data.aws_subnet_ids.selected.ids}"]

  tags {
    Name = "ecs-load-balancer"
  }
}
