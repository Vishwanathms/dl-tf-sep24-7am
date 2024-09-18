variable "vpc_cidr" {
  description = "this variable for CIDR value for VPC"
  default = "10.20.0.0/16"
  type = string
}

variable "subnets" {
  type = list 
  default = ["10.20.0.0/24", "10.20.1.0/24", "10.20.2.0/24"]
}

variable "vpc_name" {}
variable "tag_dep" {}
variable "tag_owner" {}
#variable "subnet_name" {
#  type = list
#}
variable "location" {
  
}