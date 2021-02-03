output "key_name" {
  description = "Key name created in AWS"
  value       = module.generate_key.key_name
}

output "ec2_public_ips" {
  description = "Public IPs of EC2 instances"
  value       = module.ec2_instance.public_ips
}

output "connection_details" {
  description = "Connect to the new EC2 instances using: "
  value = [
    for public_ip in module.ec2_instance.public_ips :
    "ssh -i ./${module.generate_key.key_name}.pem ec2-user@${public_ip}"
  ]
}