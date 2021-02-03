/*
*
* # Example generating new key and saving to local disk
*
* Do not use this in production!
* # Usage:
* `terraform init`
* `terraform plan`
* `terraform apply`
*
*/

resource "random_pet" "example" {}

module "generate_key" {
  name               = "tfdemo"
  source             = "../../"
  key_name           = random_pet.example.id
  download_publickey = true
  environment        = "dev"
}