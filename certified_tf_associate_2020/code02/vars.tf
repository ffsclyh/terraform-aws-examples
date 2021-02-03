variable "instancetypelist" {
  type    = list
  default = ["m5.large", "m5.xlarge"]
}

variable "defaultinstancetypes" {
  type = map
  default = {
    us-east-1  = "t2.small"
    ap-south-1 = "t2.micro"
  }
}

variable "ami_id" {
  type        = string
  description = "Image ID of the ec2 instance"
  default     = "ami-0447a12f28fddb066"
}

variable "ec2tags" {
  type    = list
  default = ["dev-ec2", "stage-ec2", "preprod-ec2"]
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Default environment for the resource creation would be dev"
}
