resource "aws_instance" "ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
   lifecycle {
    create_before_destroy = true
  } 
  tags = {
    "Name" = "VM01"
  }
}

variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}