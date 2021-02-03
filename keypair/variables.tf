variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "algorithm" {
  description = "Choose algorithm. Default: RSA"
  type        = string
  default     = "RSA"
}

variable "rsa_bits" {
  description = "Bits for the algorithm. Default: 4096"
  type        = number
  default     = 4096
}

variable "key_name" {
  description = "Public key name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "download_publickey" {
  description = "Do you want to download newly generated public key? Default no"
  type        = bool
  default     = false
}

