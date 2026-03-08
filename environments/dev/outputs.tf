# here we expose the instance details
output "instance_ids" {
  description = "IDs of EC2 instances"
  value       = aws_instance.app_server[*].id
}

output "public_ips" {
  description = "Public IPs of EC2 instances"
  value       = aws_instance.app_server[*].public_ip
}

output "private_ips" {
  description = "Private IPs of EC2 instances"
  value       = aws_instance.app_server[*].private_ip
}

output "instance_names" {
  description = "Instance Names"
  value       = aws_instance.app_server[*].tags.Name
}
