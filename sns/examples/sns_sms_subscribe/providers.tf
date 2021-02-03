terraform {
  required_version = "> 0.13.3"
  required_providers {
    aws = "~> 3.22.0"
  }
}

provider "aws" {
  region = "eu-west-2"
}