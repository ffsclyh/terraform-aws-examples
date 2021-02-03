variable "name" {
  description = "Name of the custom VPC"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Enable DNS for hostnames"
  type        = bool
}

variable "enable_classiclink" {
  description = "Classic link: should be disabled"
  type        = bool
}

variable "instance_tenancy" {
  description = "Instance tenancy. default: default"
  type        = string
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
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
