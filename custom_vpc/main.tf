/*
*
* # Resource: aws_vpc
* Create custom VPC using aws_vpc resource
*
*/

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_classiclink   = var.enable_classiclink
  instance_tenancy     = var.instance_tenancy
  tags = merge(
    {
      "Name" = format("%s", var.name)
      }, {
      Terraform   = "true"
      Environment = var.environment
    },
    var.tags,
    var.vpc_tags,
  )
}
