variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "type" {
  description = ""
  type        = string
}

variable "protocol" {
  description = ""
  type        = string
}

variable "from_port" {
  description = ""
  type        = number
}

variable "to_port" {
  description = ""
  type        = number
}

variable "cidr_blocks" {
  description = ""
  type        = list(any)
}