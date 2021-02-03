output "sns_topic_policy" {
  description = "SNS Topic policy"
  value       = aws_sns_topic_policy.default
}

output "sns_topic_policy_arn" {
  description = "SNS Topic policy ARN"
  value       = aws_sns_topic_policy.default.arn
}