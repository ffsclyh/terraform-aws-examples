variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones in scope"
  type        = list(string)
}

variable "vpc_id" {
  description = "Custom VPC id"
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

variable "environment" {
  description = "Environment name"
  type        = string
}
