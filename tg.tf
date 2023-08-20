##Target group for VPC
resource "aws_lb_target_group" "webapp-tg" {
   name = "webapp-asg"
   port     = 80
   protocol = "HTTP"
   vpc_id = aws_vpc.webapp-poc.id
 }

resource "aws_autoscaling_attachment" "webapp-autoattach" {
  autoscaling_group_name = aws_autoscaling_group.webapp-asg.id
  lb_target_group_arn   = aws_lb_target_group.webapp-tg.arn
}