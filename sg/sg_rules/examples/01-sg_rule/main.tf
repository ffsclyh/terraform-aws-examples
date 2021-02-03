/*
*
* # Example: 01-sg_rule
* Creates:
* - security group allowing SSH access
*
* ## Usage
*
* To run this example you need to execute:
*
* ```bash
* $ terraform init
* $ terraform plan
* $ terraform apply
* ```
*/

data "aws_vpc" "default" {
  default = true
}

module "ssh_group" {
  source      = "github.com/wheelq/tf-aws-lab-modules//sg/sg_group?ref=v0.1"
  name        = var.name
  group_name  = var.group_name
  description = var.description
  vpc_id      = data.aws_vpc.default.id
  environment = var.environment
}

module "sg_ingress_ssh" {
  source            = "github.com/wheelq/tf-aws-lab-modules//sg/sg_rules?ref=v0.1"
  security_group_id = module.ssh_group.security_group_id
  type              = var.ingress_type
  protocol          = var.ingress_protocol
  from_port         = var.ingress_from_port
  to_port           = var.ingress_to_port
  cidr_blocks       = var.ingress_cidr_blocks
}

module "sg_egress_ssh" {
  source            = "github.com/wheelq/tf-aws-lab-modules//sg/sg_rules?ref=v0.1"
  security_group_id = module.ssh_group.security_group_id
  type              = var.egress_type
  protocol          = var.egress_protocol
  from_port         = var.egress_from_port
  to_port           = var.egress_to_port
  cidr_blocks       = var.egress_cidr_blocks
}