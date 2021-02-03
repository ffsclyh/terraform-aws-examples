/*
*
* # EC2 module
*
*/

resource "aws_instance" "instance" {
  for_each                    = toset(var.subnet_ids)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = each.value
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids

  tags = merge(
    {
      "Name" = format(
        "%s-${var.instance_name}-${index(var.subnet_ids, each.value) + 1}",
        var.name
      )
      }, {
      Terraform   = "true"
      Environment = var.environment
    },
    var.tags,
    var.ec2_tags,
  )
}