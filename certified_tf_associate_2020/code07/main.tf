// defining provider
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

// map varibales based on the terraform workspaces
variable "instance_type" {
  type = map
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t2.large"
  }
}

// based on the workspace you are in the instance types are mapped and values are retrived.
resource "aws_instance" "webserver" {
  ami           = "ami-0447a12f28fddb066"
  instance_type = lookup(var.instance_type, terraform.workspace)
}
