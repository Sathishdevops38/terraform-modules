output "alb_id" {
  value = aws_lb.frontend_lb.id
}
output "alb_arn" {
  value = aws_lb.frontend_lb.arn
}
output "alb_dns_name" {
  value = aws_lb.frontend_lb.dns_name
}