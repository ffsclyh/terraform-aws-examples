output "vpc_id" {
  value       = module.custom_vpc.vpc_id
  description = "Custom VPC id"
}

output "public_subnets_ids" {
  value       = module.public_subnets.subnets_ids
  description = "Subnet ids"
}

output "private_subnets_ids" {
  value       = module.private_subnets.subnets_ids
  description = "Subnet ids"
}