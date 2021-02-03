resource "aws_iam_group" "limited" {
  name = "OneRegionOnly-eu-west-2"
}

resource "aws_iam_policy" "policy" {
  name        = "tf-aws-lab-RegionLimitTo-eu-west-2"
  description = "Limit access to one region only: eu-west-2"
  policy      = data.aws_iam_policy_document.policy.json
  // policy      = <<-EOP
  // {
  //   "Version": "2012-10-17",
  //   "Statement": [
  //     {
  //       "NotAction" : ["route53:*","iam:*","cloudfront:*"],
  //       "Resource": "*",
  //       "Effect": "Deny",
  //       "Condition": {
  //         "StringNotEquals": {
  //           "aws:RequestedRegion": ["eu-west-2"]
  //         }
  //       }
  //     }
  //   ]
  // }
  // EOP
}

data "aws_iam_policy_document" "policy" {
  statement {
    sid         = "TFmanagedRegionLimit"
    effect      = "Deny"
    resources   = ["*"]
    not_actions = ["cloudfront:*", "iam:*", "route53:*"]
    condition {
      test     = "StringNotEquals"
      variable = "aws:RequestedRegion"
      values   = var.limit_to_regions
    }
  }
}

resource "aws_iam_group_policy_attachment" "att" {
  group      = aws_iam_group.limited.name
  policy_arn = aws_iam_policy.policy.arn
}