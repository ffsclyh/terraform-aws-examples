provider "aws" {
  profile = "default"
  region = "ap-south-1"
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20200520.1-x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [137112412989]
}

# Create an simple EC2 instance with webserver installed
# Default VPC and default Security Group added

resource "aws_instance" "demo" {
  ami           = "${data.aws_ami.amazon-linux-2.id}"
  instance_type = "t2.micro"
  key_name = "MyLinuxEC2KeyPair"
  user_data = file("install_httpd.sh")

  tags = {
    Name = "demo"
    Environment = "dev"
  }
}
