resource "aws_sns_topic_policy" "default" {
  arn    = var.sns_topic_arn
  policy = var.policy
}
