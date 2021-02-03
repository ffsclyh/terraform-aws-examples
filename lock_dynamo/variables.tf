variable "name" {
  description = "AWS DynamoDB table for state locking"
  type        = string
}

variable "environment" {
  description = "Environment: dev/stage/prod"
  type        = string
}

