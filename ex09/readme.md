## Assumption
* You have the s3 bucket to store the state files
* Key pair is already created 
* Secruity group is created with ports, 22 & 80 inbound opened
* make sure if you are using the ec2 moudle, the module is also updated with above variables.

## Provisioners -- Remote
* Install nginx after the EC2 instance is created 

* Components
  * connection function
  * provisioners remote 

```
resource "null_resource" "install_nginx" {
    #triggers = {
    #    always_run = "${timestamp()}"
    #}
    connection {
      type = "ssh"
      user = "ec2-user"
      host = module.vm01[0].public_ip
      private_key = file("~/Downloads/skv-key1.pem")
    }
    provisioner "remote-exec" {
      inline = [ 
        "sudo yum install nginx  -y",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx",
        "curl localhost"
       ]
    }
  depends_on = [ module.vm01 ]
}
``` 
* triggers -- used to always run the resource everytime apply is run, even wheather there is changes or not
* connection -- used to connect to the vm 
* provisioner "remote-exec" {  inline = [   "sudo yum install nginx  -y", -- Remote provisioner with inline commands
* depends_on = [ module.vm01 ] - we can have dependency on the modules.

## Provisioners -- Files
* Copy sript file from local to remote 
```
    provisioner "file" {
      source = "script.sh"
      destination = "script.sh"
    }
```

## create tfvars for the root module 

```
module "vm01" {
  count = "${var.env == "prod" ? 2 : 1}"
  source = "../module/ec2"
  ami_id = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
  #subnet_id = module.network-1.subnet_ids["sub1"]
  subnet_id = data.aws_subnet.subnet1.id
  sg_ids = var.r_sg_ids
  key-name = "skv-key1"
}
```
* Here "sg_ids = var.r_sg_ids" has the variable called "r_sg_ids" defined in the root module.
* 
