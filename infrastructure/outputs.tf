output "alb_address" {
  value       = aws_instance.server.private_ip
  description = "Application Load Balanacer (ALB) DNS Name"
}

output "rds_address" {
  value       = aws_instance.server.private_ip
  description = "Relation Database Service (RDS) Endpoint"
}