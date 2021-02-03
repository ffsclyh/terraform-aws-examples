variable "name" {
  description = "Name to be used on all the resources as identifier"
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

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "subnet_cidr_blocks" {
  description = "Subnet CIDR blocks"
  type        = list(string)
}

variable "map_public_ip" {
  description = "Enable public IP"
  type        = bool
}

variable "subnet_suffix" {
  description = "Suffix to append to subnets name"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "subnet_tags" {
  description = "Additional tags for the subnets"
  type        = map(string)
  default     = {}
}
