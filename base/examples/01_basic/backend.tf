// terraform {
//   backend "s3" {
//     bucket  = ""
//     key     = "x/x/x.tfstate"
//     region  = "eu-west-2"
//     encrypt = true
//   }
// }

// data "terraform_remote_state" "state_bucket" {
//   backend = "s3"
//   config = {
//     bucket = "x"
//     key    = "x/x/x.tfstate"
//     region = "eu-west-2"
//   }
// }