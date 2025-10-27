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