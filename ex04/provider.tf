provider "aws" {
  region = var.location
  profile = "specnet-tf-aug-vms"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.1"
    }
  }
}