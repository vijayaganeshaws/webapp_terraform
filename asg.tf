## Creating Launch Configuration
resource "aws_launch_configuration" "webapp-launch_configuration" {
  image_id               = "${lookup(var.ami,var.aws_region)}"
  instance_type          = "${var.instance_type}"
  security_groups        = ["${aws_security_group.webSG.id}"]
  associate_public_ip_address = true
  key_name        = "${var.key_name}"
  user_data       = "${file("install_apache.sh")}"
  lifecycle {
    create_before_destroy = true
  }
}

## Creating AutoScaling Group
resource "aws_autoscaling_group" "webapp-asg" {
  launch_configuration = "${aws_launch_configuration.webapp-launch_configuration.name}"
  min_size = 3
  desired_capacity = 3
  max_size = 9
  load_balancers = ["${aws_elb.webapp-poc-elb.id}"]
  health_check_type = "ELB"

  vpc_zone_identifier  = "${aws_subnet.public_subnets[*].id}"
  
  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key = "Name"
    value = "webapp--poc"
    propagate_at_launch = true
  }
}