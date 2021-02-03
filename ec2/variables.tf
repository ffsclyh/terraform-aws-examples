variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "ec2_tags" {
  description = "A map of tags to add to ec2 resources"
  type        = map(string)
  default     = {}
}


variable "subnet_ids" {
  description = "Subnets IDs to be associated with the route table"
  type        = list(string)
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "key_name" {
  description = "public key name"
  type        = string
  default     = ""
}

variable "public_key" {
  description = "public key value"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Enable public IP assignment to EC2 instance"
  type        = bool
}

variable "ami_id" {
  description = "AMI id to be used for EC2"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of SG attached to this instance"
  type        = list(string)
  default     = []
}