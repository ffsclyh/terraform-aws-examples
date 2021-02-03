output "sns_topic_arn" {
  description = "SNS Topic ARN"
  value       = aws_sns_topic.topic.arn
}
output "sns_topic_dump" {
  description = "SNS Topic dump"
  value       = aws_sns_topic.topic
}