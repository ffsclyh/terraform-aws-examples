resource "aws_s3_bucket" "b" {
    bucket                      = "hank-test-csv"
    region                      = "us-east-1"
    request_payer               = "BucketOwner"
    tags                        = {}

    versioning {
        enabled    = false
        mfa_delete = false
    }
}

// create common tags on the resources
locals {
  common_tags = {
    Owner   = "Devops"
    Service = "Web"
    BU      = "CloudOps"
  }
}

// Create simple ec2 instance in ap-south-1 region
resource "aws_instance" "myec2" {
  ami           = var.ami_id
  instance_type = var.instancetype
  tags          = local.common_tags
}

// create EIP for the instance
resource "aws_eip" "lb" {
  vpc  = true
  tags = local.common_tags
}

// associate EIP to ec2 instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}

// create s3 bucket
resource "aws_s3_bucket" "mys3" {
  bucket = "demotest1234-apsouth1-06302020"
  tags   = local.common_tags
}

resource "aws_security_group" "allow_tls" {
  name = "demotest1234-sg"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }
  tags = local.common_tags
}

// if there is nothing defined with the attribute(e.g aws_eip.lb), it would display all the attributes
// we are only displaying public_ip attribute
output "eip" {
  value = aws_eip.lb.public_ip
}

output "s3_bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}
