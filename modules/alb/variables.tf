variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "instance_id" {
  description = "ID of the EC2 instance to attach to the target group"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to associate with the ALB"
  type        = string
}
