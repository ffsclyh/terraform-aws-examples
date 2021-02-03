/*
*
* # Subnet module supporting multiple subnets
*
*/

resource "aws_subnet" "subnet" {
  count                   = length(var.subnet_cidr_blocks) > 0 ? length(var.subnet_cidr_blocks) : 0
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_blocks[count.index]
  map_public_ip_on_launch = var.map_public_ip
  availability_zone       = length(var.availability_zones[count.index]) > 0 ? var.availability_zones[count.index] : null

  tags = merge(
    {
      "Name" = format(
        "%s-${var.subnet_suffix}-%s",
        var.name,
        element(var.availability_zones, count.index),
      )
      }, {
      Terraform   = "true"
      Environment = var.environment
    },
    var.tags,
    var.subnet_tags,
  )
}