resource "aws_instance" "ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.sg_ids
    key_name = var.key-name
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
variable "sg_ids" {
  type = list 
}
variable "key_name" {}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}