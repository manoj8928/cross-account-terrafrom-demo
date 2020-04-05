provider "aws" {
  region = "eu-central-1"
  assume_role {
    role_arn = "<ARN OF THE ROLE CREATED IN MAIN ACCOUNT>"
  }
  alias = "route53"
}
provider "aws" {
  region = "eu-central-1"
}
terraform {
  backend "s3" {
    bucket = "<BACKEND S3 bucket from SUB account>"
    key    = "demo/demo.tfstate"
    region = "eu-central-1"
  }
}