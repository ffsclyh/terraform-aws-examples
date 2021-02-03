/*
*
* # Example: create_bucket
* Creates:
* - S3 state bucket
*
* ## Usage
*
* To run this example you need to execute:
*
* ```bash
* $ terraform init
* $ terraform plan
* $ terraform apply
* ```
*/

module "state_bucket" {
  source = "../../"
  name   = "changeme"
  # ENVs
  environment = "prod"
}