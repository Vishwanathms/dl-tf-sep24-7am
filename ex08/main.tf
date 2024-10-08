data "aws_subnet" "subnet1" {
    vpc_id = ""
  filter {
    name   = "tag:Name"
    values = ["Def-Sub4"]
  }
  filter {
    name   = "tag:Owner"
    values = ["VI"]
  }
}

module "vm01" {
  count = "${var.env == "prod" ? 2 : 1}"
  source = "../module/ec2"
  ami_id = "ami-0ebfd941bbafe70c6"

  #ami_id = "${var.env == "prod" ? "ami-0ebfd941bbafe70c6" : "ami-0ebfd941bbafe1234"}"
  instance_type = "t2.micro"
  #subnet_id = module.network-1.subnet_ids["sub1"]
  subnet_id = data.aws_subnet.subnet1.id

}

resource "null_resource" "fetch_pip" {
    #triggers = {
    #    always_run = "${timestamp()}"
    #}
    provisioner "local-exec" {
    command = "echo public ip of ec2: ${module.vm01[0].public_ip} : $publicip  > ${path.root}/ec2meta.txt"
    interpreter = [  ]
    environment = {
      publicip = module.vm01[0].public_ip
    }
  }
}