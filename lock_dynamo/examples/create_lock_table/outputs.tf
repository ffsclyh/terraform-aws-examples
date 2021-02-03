output "table_name" {
  description = "Name of the dynamoDB lock table"
  value       = module.lock_table.table_name
}