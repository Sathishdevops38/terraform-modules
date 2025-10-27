resource "aws_lb_target_group" "alb-tg" {
  name        = var.tg_name
  target_type = var.target_type
  port        = var.tg_port
  protocol    = var.tg_protocol
  vpc_id      = var.vpc_id
}