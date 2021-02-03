// Define all the local tags
locals {
  common_tags = {
    Name      = "DemoEC2Instance"
    Owner     = "Digital-Infra"
    BU        = "Digital-Infra"
    Service   = "web"
    Account   = "AVMBrillio"
    Terraform = "True"
  }
}

// create an simple ec2 instance
resource "aws_instance" "webserver" {
  ami           = "ami-0447a12f28fddb066"
  instance_type = var.instance_type
  key_name      = "ebsdemo"
  tags          = local.common_tags
}
