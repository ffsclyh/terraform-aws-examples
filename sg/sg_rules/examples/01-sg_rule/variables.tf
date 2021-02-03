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

variable "ingress_type" {
  description = ""
  type        = string
}

variable "ingress_protocol" {
  description = ""
  type        = string
}

variable "ingress_from_port" {
  description = ""
  type        = number
}

variable "ingress_to_port" {
  description = ""
  type        = number
}

variable "ingress_cidr_blocks" {
  description = ""
  type        = list(any)
}

variable "egress_type" {
  description = ""
  type        = string
}

variable "egress_protocol" {
  description = ""
  type        = string
}

variable "egress_from_port" {
  description = ""
  type        = number
}

variable "egress_to_port" {
  description = ""
  type        = number
}

variable "egress_cidr_blocks" {
  description = ""
  type        = list(any)
}