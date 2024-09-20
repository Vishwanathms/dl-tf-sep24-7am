module "vm01" {
  count = "${var.env == "prod" ? 2 : 1}"
  source = "../module/ec2"
  ami_id = "ami-0ebfd941bbafe70c6"

  #ami_id = "${var.env == "prod" ? "ami-0ebfd941bbafe70c6" : "ami-0ebfd941bbafe1234"}"
  instance_type = "t2.micro"
  #subnet_id = module.network-1.subnet_ids["sub1"]
  subnet_id = "subnet-0d6ac36c57a9960b6"
}