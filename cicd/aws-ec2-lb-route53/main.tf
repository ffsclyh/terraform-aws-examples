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

# Create a target group
resource "aws_lb_target_group" "demo-tg" {
  name     = "demo-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-91d7a5f8"
  deregistration_delay = 40
  health_check {
      port = "traffic-port"
      timeout = 8
  }

  tags = {
    Name = "demp-tg"
    Environment = "dev"
  }
}

# Create an application load balancer
resource "aws_lb" "demo" {
  name               = "demo-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-0448fa0acdf8474f0"]
  subnets            = ["subnet-5a2a5533","subnet-c757e68a","subnet-d607fdad"]
  enable_deletion_protection = false

  tags = {
    Name = "demo-lb"
    Environment = "dev"
  }
}

# # attach the target group to newly created load balancer
# resource "aws_lb_target_group_attachment" "demo-attach-tg-lb" {
#   target_group_arn = "aws_lb_target_group.demo-tg.arn"
#   target_id        = "aws_instance.demo.id"
#   port             = 80
# }
