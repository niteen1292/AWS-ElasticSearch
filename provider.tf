provider "aws" {
  region = "${var.es_region}"
}

#Manually created bucket for remote state
terraform {
  backend "s3" {
    bucket = "yash-infrastructure-as-code"
    key    = "ES/ES.tfstate"
    region = "us-east-1"
  }
}
