output "sns_topic_policy" {
  description = "SNS Topic policy"
  value       = module.sns_policy.sns_topic_policy
}

output "sns_topic_policy_arn" {
  description = "SNS Topic ARN"
  value       = module.sns_create.sns_topic_arn
}

