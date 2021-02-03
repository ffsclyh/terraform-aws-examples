resource "aws_sns_topic" "topic" {
  name = var.sns_topic_name
}