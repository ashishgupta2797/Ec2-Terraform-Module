/*--------------- Region Code Variables ---------------*/


variable "region_code" {
  description = "Enter your region code to install ec2-instance"
  type        = string
  default     = "us-west-2" # Set your desired size
}


/*--------------- Public SG Variables ---------------*/

variable "public_ingress_ports" {
  description = "SG inbound ports"
  type        = list(number)
  default     = [22, 443, 80]
}
variable "public_sg_name" {
  type    = string
  default = "public-SG"
}

/*--------------- Key Pair Variables ---------------*/

variable "key_pair" {
  type    = string
  default = "private-key"
}


/*--------------- AMI Variables---------------*/

variable "ami_id" {
  type    = string
  default = "ami-008fe2fc65df48dac"
}

/*--------------- Public Instance Variables ---------------*/
variable "public_instance_count" {
  description = "Number of public instances to create"
  type        = number
  default     = 1
}

variable "public_instance_type" {
  description = "type of instance for public server"
  type        = string
  default     = "t2.micro"
}

variable "public_instance_name" {
  description = "public instance name"
  type        = string
  default     = "public-instance"

}

variable "root_volume_size" {
  description = "Size of the root volume in gigabytes"
  type        = number
  default     = 16 # Set your desired size
}
