/*
*
* # Example: 01-public-routing
* Creates:
* - vpc
* - public subnets
* - routing
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

data "aws_availability_zones" "available" {}

module "custom_vpc" {
  source               = "github.com/wheelq/tf-aws-lab-modules//custom_vpc?ref=v0.1"
  name                 = var.name
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_classiclink   = var.enable_classiclink
  instance_tenancy     = var.instance_tenancy
  environment          = var.environment

}

module "public_subnets" {
  source             = "github.com/wheelq/tf-aws-lab-modules//subnets?ref=v0.1"
  name               = var.name
  vpc_id             = module.custom_vpc.vpc_id
  availability_zones = data.aws_availability_zones.available.names
  subnet_cidr_blocks = var.subnet_cidr_blocks
  map_public_ip      = var.map_public_ip
  subnet_suffix      = var.subnet_suffix
  subnet_tags        = var.subnet_tags
  environment        = var.environment
}

module "public_routing" {
  source                 = "github.com/wheelq/tf-aws-lab-modules//routing?ref=v0.1"
  name                   = var.name
  vpc_id                 = module.custom_vpc.vpc_id
  subnets                = module.public_subnets.subnets_ids
  destination_cidr_block = var.destination_cidr_block
  environment            = var.environment
}