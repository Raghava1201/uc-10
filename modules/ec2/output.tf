output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.focalboard.id
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.focalboard_sg.id
}
