
provider "aws" {
  region = var.region_code
}


/*--------------- Public Instance ---------------*/


resource "aws_instance" "ec2-project" {
  count         = var.public_instance_count
  ami           = var.ami_id
  instance_type = var.public_instance_type
  key_name      = var.key_pair

root_block_device {
    volume_size = var.root_volume_size
  }

  tags = {
    Name = "${var.public_instance_name}-0${count.index + 1}"
  }
depends_on = [aws_key_pair.private-key-pair]
}


/*--------------- Key Pair ---------------*/

resource "aws_key_pair" "private-key-pair" {
  key_name   = var.key_pair
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "private-key-pair" {
  content         = tls_private_key.rsa.private_key_pem
  file_permission = "0400"
  filename        = "${var.key_pair}.pem"
}

/*--------------- Bastion SG ---------------*/

resource "aws_security_group" "public-SG" {
  name        = var.public_sg_name
  description = "SG for public server"
  dynamic "ingress" {
    for_each = var.public_ingress_ports
    iterator = ingress_port
    content {
      from_port   = ingress_port.value
      protocol    = "TCP"
      to_port     = ingress_port.value
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
