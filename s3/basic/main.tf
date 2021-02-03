/*
*
* # S3 module
*  ---
*  Please go to [examples](/examples/)
*
*/

# ------------------------------------------------------------------------------
# CREATE THE S3 BUCKET
# ------------------------------------------------------------------------------
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  versioning {
    enabled = false
  }
  force_destroy = true
  tags = {
    Name          = var.name
    Environment   = var.environment
    Role          = "TF"
    OwningCluster = "Terraform"
    ContactEmail  = "wheelq@gmail.com"
    TFRepo        = "https://github..."
  }
}
