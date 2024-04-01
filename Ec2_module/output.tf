/*--------------- Output Values ---------------*/

output "public_instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.ec2-project[*].id
}

output "public_instance_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.ec2-project[*].public_ip
}

output "key_pair_name" {
  description = "Name of the key pair"
  value       = aws_key_pair.private-key-pair.key_name
}
