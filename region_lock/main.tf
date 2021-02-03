data "aws_iam_user" "current" {
  user_name = var.user_name
}

resource "aws_iam_user_group_membership" "example1" {
  user = data.aws_iam_user.current.user_name
  groups = [
    aws_iam_group.limited.name
  ]
}