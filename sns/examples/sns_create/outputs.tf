output "sns_topic_arn" {
  description = "SNS Topic ARN"
  value       = module.sns_create.sns_topic_arn
}

output "sns_topic_dump" {
  description = "SNS Topic dump"
  value       = module.sns_create.sns_topic_dump
}