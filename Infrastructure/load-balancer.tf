resource "aws_lb_target_group" "app-lb-tg" {
  name     = "app-lb-tg"
  port     = "3000"
  protocol = "HTTP"
  vpc_id   = module.network.vpc_id
}
resource "aws_lb_target_group_attachment" "app-tg-attach" {
  target_group_arn = aws_lb_target_group.app-lb-tg.arn
  target_id        = aws_instance.application.id
  port             = "3000"
}
resource "aws_lb" "app-lb" {
  name                       = "app-lb"
  internal                   = false
  security_groups            = [aws_security_group.my_sg.id]
  subnets                    = [module.network.pb1_sub_id, module.network.pb2_sub_id]
  ip_address_type            = "ipv4"
  enable_deletion_protection = false
}
resource "aws_alb_listener" "app-lb-listener" {
  load_balancer_arn = aws_lb.app-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.app-lb-tg.arn
    type             = "forward"
  }
}