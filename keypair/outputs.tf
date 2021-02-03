output "key_name" {
  description = "Private key name"
  value       = aws_key_pair.stored.key_name
}

output "public_key_openssh" {
  description = "Public key in openssh format"
  value       = tls_private_key.key.public_key_openssh
}