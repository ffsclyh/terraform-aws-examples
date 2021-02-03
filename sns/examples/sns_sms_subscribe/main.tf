/*
*
* # SNS: SMS subscription
*
*/
data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "create_sns" {
  source         = "../../sns_create"
  account_id     = local.account_id
  sns_topic_name = "my-awesome-topic-name"
}

module "sns_sms_subscribe" {
  source        = "../../sns_subscribe"
  sns_topic_arn = module.create_sns.sns_topic_arn
  protocol      = "sms"
  endpoint      = var.endpoint
}