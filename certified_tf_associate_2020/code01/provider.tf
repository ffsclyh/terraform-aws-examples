provider "aws" {
  region  = "us-east-1"

  // define the version of the provider so that code don't break.
  // "~>2.0" - gets the latest provider
  // "~>2.0,~<2.30" - gets provider upto 2.30
  version = "~>2.0"
}
