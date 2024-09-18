## This module is creating the below 

* VPC 
* random shuffles for subnet name
* Subnets using for_each with map
* Internet gateway 
* Update the IGW to default route table

```
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
```