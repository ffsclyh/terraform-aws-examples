/* # Group policy - region access control
* This example shows how to lock selected user to two regions only (except some global services)
*
* # Usage:
* `terraform init`
* `terraform plan`
* `terraform apply`
*
*/

module "user_region_lock" {
  source           = "../../"
  user_name        = "wheelq"
  limit_to_regions = ["eu-west-2", "us-east-1"]
}