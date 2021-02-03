/*
*
* # Security group module
*
*/

resource "aws_security_group" "security_group" {
  name        = var.group_name
  description = var.description
  vpc_id      = var.vpc_id

  tags = merge(
    {
      "Name" = format("%s-%s", var.name, var.group_name)
      }, {
      Terraform   = "true"
      Environment = var.environment
    },
    var.tags
  )
}