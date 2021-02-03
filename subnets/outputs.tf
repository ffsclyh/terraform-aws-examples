output "subnets_ids" {
  value       = aws_subnet.subnet.*.id
  description = "IDs for subnets"
}