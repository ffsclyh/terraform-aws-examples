provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}
