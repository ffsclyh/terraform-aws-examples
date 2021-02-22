provider "aws" {
  region  = var.region
  profile = "default"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type    = list
  default = ["dev", "qa", "prod"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1"  = "ami-0323c3dd2da7fb37d"
    "us-west-2"  = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0447a12f28fddb066"
  }
}

resource "aws_instance" "app-dev" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  count         = 1

  tags = {
    Name = element(var.tags, count.index)
  }
}

// Create security group - before dynamic
// the long list of the ingress rules can be shortened.
resource "aws_security_group" "app-dev_sg" {
  name = "sample-sg"

  ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8201
    to_port     = 8201
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// dynamic block for creation of SG
// define sg variable and iterate through the resource
variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8202, 8203]
}

resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "Ingress for Vault"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "timestamp" {
  value = local.time
}
