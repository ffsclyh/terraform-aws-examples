variable "user_name" {
  description = "Username you wish to limit access for"
  type        = string
}
variable "limit_to_regions" {
  description = "Regions which the user will have access to"
  type        = list(any)
}