provider "aws" {
region = "ap-south-1"
}

# Codecommit resources
resource "aws_codecommit_repository" "repo" {
  repository_name = var.repo_name
  description     = "${var.repo_name} repository."
  default_branch  = var.repo_default_branch
}

# CodePipeline artifact store for s3 resources
resource "aws_s3_bucket" "build_artifact_bucket" {
  bucket        = "artifact-repo-demo-6te65"
  acl           = "private"
  force_destroy = var.force_artifact_destroy
}

# -------   IAM policy, roles for codebuild  -------   #

# -------   START  -------   #
# codepipeline assume policy
data "aws_iam_policy_document" "codepipeline_assume_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

# codepipeline assume role
resource "aws_iam_role" "codepipeline_role" {
  name               = "demo-codepipeline-role"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume_policy.json
}

# codepipeline policy to use codecommit and codebuild
data "template_file" "codepipeline_policy_template" {
  template = file("./iam/codepipeline.tpl")
  vars = {
    artifact_bucket = aws_s3_bucket.build_artifact_bucket.arn
  }
}

resource "aws_iam_role_policy" "attach_codepipeline_policy" {
  name = "demo-codepipeline-policy"
  role = aws_iam_role.codepipeline_role.id
  policy = data.template_file.codepipeline_policy_template.rendered
}

# CodeBuild IAM Permissions
data "template_file" "codepipeline_assume_role_policy_template" {
  template = file("./iam/codebuild_assume_role.tpl")
}

# codebuild assume role
resource "aws_iam_role" "codebuild_assume_role" {
  name               = "demo-codebuild-role"
  assume_role_policy = data.template_file.codepipeline_assume_role_policy_template.rendered
}

data "template_file" "codebuild_policy_template" {
  template = file("./iam/codebuild.tpl")
  vars = {
    artifact_bucket         = aws_s3_bucket.build_artifact_bucket.arn
    codebuild_project_build = aws_codebuild_project.build_project.id
  }
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name = "demo-codebuild-policy"
  role = aws_iam_role.codebuild_assume_role.id
  policy = data.template_file.codebuild_policy_template.rendered
}

# -------   END  -------   #

# CodeBuild Section
resource "aws_codebuild_project" "build_project" {
  name           = "${var.repo_name}-build"
  description    = "The CodeBuild project for ${var.repo_name}"
  service_role   = aws_iam_role.codebuild_assume_role.arn
  build_timeout  = var.build_timeout

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = var.build_compute_type
    image           = var.build_image
    type            = var.codebuild_type
    privileged_mode = var.build_privileged_override
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = var.package_buildspec
  }
}

# CodePipeline
resource "aws_codepipeline" "codepipeline" {
  name     = var.repo_name
  role_arn = aws_iam_role.codepipeline_role.arn

    artifact_store {
      location = aws_s3_bucket.build_artifact_bucket.bucket
      type     = "S3"
  }

  # source stage

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["demo-source-output"]

      configuration = {
        RepositoryName = var.repo_name
        BranchName     = var.repo_default_branch
      }
    }
  }

 # Build stage
  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["demo-source-output"]
      output_artifacts = ["demo-build-output"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.build_project.name
      }
    }
  }
}
