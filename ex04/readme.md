## Variables -- MAPS

* VPC is already created in multiple regions 
* we cannot change the VPC's but wanted to create subnets on it 

## Maps example
```
variable "vpc_ids" {
  type = map 
  default = {
    "us-east-1" = "vpc-030fe5add21e52fdd"
    "us-east-2" = "vpc-06f4f7e22cda7cf1e"
  }
}
```
* Here the key has been specified 