provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

module "ec2module" {
  source        = "../modules/ec2"
  instance_type = "t2.large"
}
