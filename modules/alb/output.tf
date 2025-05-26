output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_alb.alb.dns_name
}
