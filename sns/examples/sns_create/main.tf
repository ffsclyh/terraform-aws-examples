data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "sns_create" {
  source         = "../../sns_create"
  account_id     = local.account_id
  sns_topic_name = "my-awesome-topic-name"
}
