variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "group_name" {
  description = "Name for the security group"
  type        = string
}

variable "description" {
  description = ""
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}
