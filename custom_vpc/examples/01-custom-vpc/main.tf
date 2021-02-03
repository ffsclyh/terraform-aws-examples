/*
*
* # Example: 01-custom-vpc
* Creates:
* - custom vpc using the module
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
*
*/

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