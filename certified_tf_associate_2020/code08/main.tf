provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

// reference ec2 resource creation from the module directory
module "ec2statemgmt" {
  source = "../modules/ec2"
}

//storing the statefile in the remote directory
// this s3 bucket should have already existed

# terraform {
#   backend "s3" {
#     bucket = "demo-s3statebackend-010720201637"
#     key    = "demo.tfstate"
#     region = "ap-south-1"
#   }
# }
