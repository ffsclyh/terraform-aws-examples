/*
*
* # Example: create_lock_table
* Creates:
* - DynamoDB tablo used for locks
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
module "lock_table" {
  source      = "../../"
  name        = "tf_lock_table"
  environment = "prod"
}