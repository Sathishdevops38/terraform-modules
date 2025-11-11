output "alb_id" {
  value = aws_lb.this.id
}
output "alb_arn" {
  value = aws_lb.this.arn
}

output "alb_zone_id" {
  # Change 'aws_lb.backend_alb' to match the actual resource name in the module
  value       = aws_lb.this.zone_id 
  description = "The Hosted Zone ID of the Application Load Balancer."
}
output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "tg_name" {
  value = aws_lb_target_group.this-tg.name
}

output "tg_arn" {
  value = aws_lb_target_group.this-tg.arn
}

output "tg_id" {
  value = aws_lb_target_group.this-tg.id
}
