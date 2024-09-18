## how to secure the credentials of aws 

Steps
* install aws cli v2
* run "aws configure" provide the access and secret keys, 
* the keys are stored in default path "c:\users\username\.aws\credentials"
* in the terraform script change it as below, by removing credentials and mentioning profile name.
```
provider "aws" {
  region = "us-east-1"
  profile = "default"
}
```

## create variable for the cidr for vpc
* Varaibles are symbolic names for the values in the script 
* we can access the variable name outside the script in the cli or from another file

1. type = string 
* while running the terraform plan 
  * variables can be given on the fly as input 
  * provide it in the cli command
    * terraform plan -var vpc_cidr="10.30.0.0/16"

2. type = list 
* without list , if we want to create 3 subnets it would look as below 
```
resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.20.0.0/24"
}

resource "aws_subnet" "sub2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.20.1.0/24"
}

resource "aws_subnet" "sub3" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.20.2.0/24"
}
```
* but if we use "list" it wold look as below
```
resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnets[0]
}

variable "subnets" {
  type = list 
  default = ["10.20.0.0/24", "10.20.1.0/24", "10.20.2.0/24"]
}
```
* the above code will refer to first value in the list variable "subnets"

* We want to create 3 subnets in an optimizaed way
* with the combination of count we cna achive this
```
resource "aws_subnet" "subnet" {
  count = "3"
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnets[count.index]
}
```
* there is one more problem, each time the no of subnets increase , we have to manually change the count value, 
* to automate it we can use the function called as "length"
```
count = length(var.subnets)
```

* Provide the values in the cli 
```
terraform plan -var vpc_cidr="10.30.0.0/16"
```
  
