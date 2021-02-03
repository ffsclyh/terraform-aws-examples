provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

// Create common tags for the resources

locals {
  common_tags = {
    Name         = "Webserver-Demo"
    BusinessUnit = "DI"
    Environment  = "Testing"
    Owner        = "DICloud"
  }
}

resource "aws_instance" "webserver" {
  ami           = "ami-0447a12f28fddb066"
  instance_type = "t2.micro"
  key_name      = "ebsdemo"

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./ebsdemo.pem")
      host        = self.public_ip
    }
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.webserver.public_ip} >> public_ip.txt"
  }

  tags = local.common_tags
}

output "webserver" {
  value = aws_instance.webserver.public_ip
}
