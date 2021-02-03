output "default_vpc_id" {
  value = aws_vpc.default.id
}

output "default_security_group_id" {
  value = aws_security_group.default.id
}

output "default_subnet_id" {
  value = aws_subnet.default.id
}

output "aws_key_pair_id" {
  value = aws_key_pair.auth.id
}
