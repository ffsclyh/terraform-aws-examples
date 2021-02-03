/*
*
* # Dynamic public/private key generator
*
* Do not use this in production! Homelab and troubleshooting purposes only.
*
* ## Resources created:
*
* - tls_private_key
* - aws_key_pair
* - [optional] downloads private key to the host machine
*
*/

resource "tls_private_key" "key" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "stored" {
  key_name   = var.key_name
  public_key = tls_private_key.key.public_key_openssh
  tags = merge(
    {
      "Name" = format(
        "%s-${var.key_name}",
        var.name
      )
      }, {
      Terraform   = "true"
      Environment = var.environment
    }
  )
}

resource "local_file" "cloud_pem" {
  count             = var.download_publickey ? 1 : 0
  filename          = "${var.key_name}.pem"
  sensitive_content = tls_private_key.key.private_key_pem
  provisioner "local-exec" {
    command = "chmod 600 ${var.key_name}.pem"
  }
}
