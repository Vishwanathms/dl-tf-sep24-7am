provider "aws" {
  region = "us-east-1"
  profile = "specnet-tf-aug-vms"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }
}

terraform {
  backend "s3" {
    key = "devopsb3/terraform-dev.tfstate"
    bucket = "vishwa23082024"
    region = "us-east-1"
    profile = "specnet-tf-aug-vms"
    encrypt = true
    dynamodb_table = "terraform-lock-table"
  }
}