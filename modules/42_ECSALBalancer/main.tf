#----42_ECSALBalancer/main.tf-----

resource "aws_alb" "tf_ecs-load-balancer" {
    name                = "ecs-load-balancer"
#    security_groups     = ["${aws_security_group.test_public_sg.id}"]
    subnets             =  "${var.vpc_private_subnets_id}"

    tags {
      Name = "ecs-load-balancer"
    }
}
