module "network-1" {
  source = "../module/vpc-subnet"
  location = "us-east-1"
  vpc_cidr="10.10.0.0/16"
  #subnets=["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"] 
  vpc_name="vpc1-dev" 
  tag_dep="IT" 
  tag_owner="Vishwa" 
  subnets = {
      "sub1" = ["sub1", "10.10.3.0/24", "us-east-1a"]
      "sub2" = ["sub2", "10.10.4.0/24", "us-east-1b"]
      "sub3" = ["sub3", "10.10.5.0/24", "us-east-1c"]
    }
}

module "network-2" {
  source = "../module/vpc-subnet"
  location = "us-east-1"
  vpc_cidr="10.20.0.0/16"
  #subnets=["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"] 
  vpc_name="vpc1-dev" 
  tag_dep="IT" 
  tag_owner="Vishwa" 
  subnets = {
      "sub1" = ["sub1", "10.20.3.0/24", "us-east-1a"]
      "sub2" = ["sub2", "10.20.4.0/24", "us-east-1b"]
      "sub3" = ["sub3", "10.20.5.0/24", "us-east-1c"]
    }
}


module "vm01" {
  source = "../module/ec2"
  ami_id = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
  #subnet_id = module.network-1.subnet_ids["sub1"]
  subnet_id = module.network-1.subnet_id_sub1
}

output "subnet_ids_stack" {
  value = module.network-1.subnet_ids
}

output "subnet_id_sub1" {
  value = module.network-1.subnet_id_sub1
}