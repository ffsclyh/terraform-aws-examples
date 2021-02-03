variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "group_name" {
  description = ""
  type        = string
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "description" {
  description = ""
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Environment name"
  type        = string
}
