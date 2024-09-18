
resource "random_integer" "sub_number" {
  count = length(var.subnets)
  min = 1
  max = 6

}

resource "random_shuffle" "subnet_ids" {
  input = range(1, 6)  
  result_count = length(var.subnets)  
}


resource "aws_vpc" "main" {
  #cidr_block = "10.0.0.0/16"
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = var.vpc_name
    "Dep"  = var.tag_dep
    "Owner" = var.tag_owner
  }
}

resource "aws_subnet" "subnet" {
  count = length(var.subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnets[count.index]
  tags = {
    #"Name" = var.subnet_name[count.index]
    #"Name" = "sub-${random_integer.sub_number[count.index].result}"
    "Name" = "sub-${random_shuffle.subnet_ids.result[count.index]}"
    "Dep"  = var.tag_dep
    "Owner" = var.tag_owner
  }
}



