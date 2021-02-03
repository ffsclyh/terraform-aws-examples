provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

module "ec2-instance" {
  source                 = "../modules/tf-aws-ec2-instance"
  name                   = "MyWebserver"
  instance_count         = 1
  ami                    = "ami-0447a12f28fddb066"
  instance_type          = "t2.micro"
  key_name               = "demo"
  monitoring             = false
  vpc_security_group_ids = ["sg-xxxx"]
  subnet_id              = "subnet-xxxxxx"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
