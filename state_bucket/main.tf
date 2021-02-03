/*
*
* # State bucket used to store terraform state files
* This module creates S3 bucket, used by Terraform to store its state files
* Please go to [example](example/create_bucket) for more information
*
*/
# ------------------------------------------------------------------------------
# CREATE THE S3 BUCKET
# ------------------------------------------------------------------------------
resource "aws_s3_bucket" "state" {
  bucket = var.name
  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }
  force_destroy = true
  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    Name          = var.name
    Environment   = var.environment
    Role          = "TF"
    OwningCluster = "Terraform"
    ContactEmail  = "wheelq@gmail.com"
    TFRepo        = "https://github..."
  }
}