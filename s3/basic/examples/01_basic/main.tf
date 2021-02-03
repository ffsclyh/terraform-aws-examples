/*
*
* # S3 demo
*  ---
*
*  ## Usage:
*
* `terraform init`
* `terraform plan`
* `terraform apply`
*
*/

resource "random_pet" "bucket_name" {
  length = 4
  prefix = var.name
}

module "s3_basic" {
  source      = "../../"
  name        = var.name
  bucket_name = lower(random_pet.bucket_name.id)
  environment = var.environment
}