variable "sns_topic_arn" {
  description = "The ARN of the SNS topic to subscribe to"
  type        = string
}

variable "protocol" {
  description = "The protocol to use. The possible values for this are: sqs, sms, lambda, application. (http or https are partially supported)"
  type        = string
}

variable "endpoint" {
  description = "The endpoint to send data to, the contents will vary with the protocol"
  type        = string
}
