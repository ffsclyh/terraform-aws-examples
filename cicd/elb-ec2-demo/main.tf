provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

#Network Creation
#Vpc
resource "aws_vpc" "TF_Vpc" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames  = true
  instance_tenancy = "default"
  tags = {
    Name = "Vpc"
  }
}

#PublicSubnet
resource "aws_subnet" "PublicSubnet" {
  vpc_id     = "${aws_vpc.TF_Vpc.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

   tags = {
       Name = "PublicSubnet"
   }
}

#IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.TF_Vpc.id}"

  tags = {
    Name = "IGW"
  }
}

#PublicRouteTable
resource "aws_route_table" "PublicRouteTable" {
  vpc_id = "${aws_vpc.TF_Vpc.id}"
  tags = {
    Name = "PublicRouteTable"
  }
}

#Attach IGW to PublicRT
resource "aws_route" "route1" {
  route_table_id            = "${aws_route_table.PublicRouteTable.id}"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.igw.id}"
  depends_on                = ["aws_route_table.PublicRouteTable"]
}

#Associate PublicSubnet1 with PublicRT
resource "aws_route_table_association" "PublicSubnet1RTAssociation" {
  subnet_id      = "${aws_subnet.PublicSubnet.id}"
  route_table_id = "${aws_route_table.PublicRouteTable.id}"
}

resource "aws_security_group" "ec2_sg" {
  name        = "Web_Server_SG"
  description = "Connect EC2 "
  vpc_id      = "${aws_vpc.TF_Vpc.id}"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Web_App_SG"
  }
}

resource "aws_instance" "instance" {
  ami           = "ami-01d025118d8e760db"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  subnet_id     = "${aws_subnet.PublicSubnet.id}"
  security_groups = ["${aws_security_group.ec2_sg.id}"]
  key_name      = var.ec2_key
  tags = {
    Name = "WebApp_Server"
  }
  user_data = <<-EOF
              #! /bin/bash
              sudo su -
              yum update -y
              yum install -y httpd24 php56 php56-mysqlnd
              chmod 777 /var/www/
              echo "<!DOCTYPE html>   
              <html>
              <head>
              <title>
              Demo Web Page
              </title>
              </head>
              <body>
              <h1>Good Morning, Have a nice day!<h1> 
              </body>
              </html>"  >> /var/www/html/index.html
              service httpd start
              chkconfig httpd on
              EOF
}

resource "aws_elb" "elb" {
  name               = "elb"
  subnets = ["${aws_subnet.PublicSubnet.id}"]
  security_groups = ["${aws_security_group.ec2_sg.id}"]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = ["${aws_instance.instance.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "ELB"
  }
}

resource "aws_elb_attachment" "elba" {
  elb      = "${aws_elb.elb.id}"
  instance = "${aws_instance.instance.id}"
}