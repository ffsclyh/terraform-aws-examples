resource "aws_s3_bucket" "b" { }

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}


// Create simple ec2 instance in ap-south-1 region
resource "aws_instance" "myec2" {
  ami = var.ami_id
  // you can reference through the map
  instance_type = var.defaultinstancetypes["ap-south-1"]
  // you can also referenct through the index
  #instance_type = var.instancetypelist[0]

  // since the list is created for 3 items so count=3
  count = 3

  tags = {
    // count would be incremented by resource
    Name = var.ec2tags[count.index]
  }
}

// interpoliation using environment for dev or prod
// dev is the default so you can just say "terraform plan"
// prod is to be explicitly said so, "terraform plan -var.environment="prod"

locals {
  // define locals so that you can use the tags accordingly for the resources
  name_prefix = "${var.environment == "dev" ? "dev" : "prod"}"
}

resource "aws_instance" "myec2-interpolation" {
  ami = var.ami_id
  // you can reference through the map
  instance_type = var.defaultinstancetypes["ap-south-1"]
  // you can also reference through the index
  #instance_type = var.instancetypelist[0]

  // if your default env == dev it will create 2 instances or it will create 1 instance
  count = var.environment == "dev" ? 2 : 1

  tags = {
    // count would be incremented by resource
    Name = local.name_prefix
  }
}
