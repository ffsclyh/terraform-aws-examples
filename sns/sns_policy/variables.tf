variable "policy" {
  description = "SNS Policy document as JSON"
  type        = string
}

variable "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  type        = string
}