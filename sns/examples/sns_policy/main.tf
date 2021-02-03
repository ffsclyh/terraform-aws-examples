data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "sns_create" {
  source         = "../../sns_create"
  account_id     = local.account_id
  sns_topic_name = "my-awesome-topic-name"
}

module "sns_policy" {
  source        = "../../sns_policy"
  sns_topic_arn = module.sns_create.sns_topic_arn
  policy        = data.aws_iam_policy_document.sns_topic_policy.json
}