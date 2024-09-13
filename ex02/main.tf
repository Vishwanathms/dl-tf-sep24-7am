provider "aws" {
  region = "us-east-1"
  profile = "specnet-tf-aug-vms"
}

resource "aws_vpc" "main" {
  #cidr_block = "10.0.0.0/16"
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet" {
  count = length(var.subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnets[count.index]
}

variable "vpc_cidr" {
  description = "this variable for CIDR value for VPC"
  default = "10.20.0.0/16"
  type = string
}

variable "subnets" {
  type = list 
  default = ["10.20.0.0/24", "10.20.1.0/24", "10.20.2.0/24"]
}

