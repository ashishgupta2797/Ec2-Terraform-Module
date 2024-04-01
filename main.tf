/*--------------- Public SG Module---------------*/

module "ec2" {
  source                = "https://github.com/ashishgupta2797/Ec2-Terraform-Module.git"

  # Pass variables for region
  region_code = "us-west-2"

  # Pass variables to the module
  key_pair              = "private-key"
  ami_id                = "ami-008fe2fc65df48dac"
  public_instance_count = 2
  public_instance_type  = "t2.medium"
  public_instance_name  = "public-instance"
  root_volume_size      = "16"
}

/*--------------- Output Values ---------------*/

output "public_instance_ids" {
  description = "IDs of the EC2 instances"
  value       = module.ec2.public_instance_ids
}

output "public_instance_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = module.ec2.public_instance_ips
}

output "key_pair_name" {
  description = "Name of the key pair"
  value       = module.ec2.key_pair_name
}
