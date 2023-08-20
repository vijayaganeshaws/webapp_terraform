### Creating ELB
resource "aws_elb" "webapp-poc-elb" {
    name = "webapp-asg"
    security_groups = ["${aws_security_group.elb.id}"]
    subnets         = aws_subnet.public_subnets[*].id

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = "80"
    lb_protocol = "http"
}

  health_check {
    healthy_threshold = "2"
    unhealthy_threshold = "3"
    timeout = "3"
    target = "tcp:80"
    interval = 30
  }
}