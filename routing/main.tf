/*
*
* # Routing module
*
*/

resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name" = format("%s-rt", var.name)
      }, {
      Terraform   = "true"
      Environment = var.environment
    },
    var.tags
  )
}


resource "aws_route_table_association" "route_table_association" {
  count          = length(var.subnets)
  route_table_id = aws_route_table.rt.id
  subnet_id      = var.subnets[count.index]
}


resource "aws_route" "route_gw" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.igw.id
}


# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name" = format("%s-igw", var.name)
      }, {
      Terraform   = "true"
      Environment = var.environment
    },
    var.tags
  )
}