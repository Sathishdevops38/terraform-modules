resource "aws_lb" "frontend_lb" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.security_groups]
  subnets            = var.subnets

  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(
    var.alb_tags,
    local.common_tags,
    {
        Name = "${local.common_name_suffix}-frontend-lb"
    }
  )
}

resource "aws_lb_target_group" "alb-tg" {
  name        = var.tg_name
  target_type = var.target_type
  port        = var.tg_port
  protocol    = var.tg_protocol
  vpc_id      = var.vpc_id
   tags = merge(
    var.alb_tg_tags,
    local.common_tags,
    {
        Name = "${local.common_name_suffix}-frontend-lb-tg"
    }
  )
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.frontend_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}