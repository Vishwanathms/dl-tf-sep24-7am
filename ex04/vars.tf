variable "tag_dep" {}
variable "tag_owner" {}
variable "location" {
  
}

variable "vpc_ids" {
  type = map 
  default = {
    "us-east-1" = "vpc-030fe5add21e52fdd"
    "us-east-2" = "vpc-06f4f7e22cda7cf1e"
  }
}

variable "subnets" {
  type = map 
  default = {
    "sub1" = "10.20.3.0/24"
    "sub2" = "10.20.4.0/24"
    "sub3" = "10.20.5.0/24"  
  }
}

variable "subnets" {
  type = map(list(string))
  default = {
    "sub1" = ["sub1", "10.20.3.0/24", "us-east-1a"]
    "sub2" = ["sub2", "10.20.4.0/24", "us-east-1b"]
    "sub3" = ["sub3", "10.20.5.0/24", "us-east-1c"]
  }
}

variable "subnet1" {
  type = map(object({
    name = "sub1"
    cidr = "10.20.3.0/24"
    az = "us-east-1a"
  },
  {
    name = "sub2"
    cidr = "10.20.4.0/24"
    az = "us-east-1b"
  }
  ))
}