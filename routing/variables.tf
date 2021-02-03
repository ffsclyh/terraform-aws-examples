variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "vpc_id" {
  description = "Custom VPC id"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}


variable "subnets" {
  description = "Subnets to be associated with the route table"
  type        = list(string)
}

variable "destination_cidr_block" {
  description = "Destination CIDR for ingress"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}
