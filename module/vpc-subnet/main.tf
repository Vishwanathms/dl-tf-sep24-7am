resource "aws_vpc" "vpc" {
  #cidr_block = "10.0.0.0/16"
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = var.vpc_name
    "Dep"  = var.tag_dep
    "Owner" = var.tag_owner
  }
}

resource "random_shuffle" "subnet_ids" {
  input = range(7, 9)  
  result_count = length(var.subnets)  
}

resource "aws_subnet" "subnet" {
  for_each = var.subnets
  vpc_id = aws_vpc.vpc.id
  cidr_block = each.value[1]
  availability_zone = each.value[2]
  tags = {
    "Name" = each.value[0]
    "Dep"  = var.tag_dep
    "Owner" = var.tag_owner
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id 
  tags = {
    "Name" = "igw-${var.vpc_name}"
    "Dep"  = var.tag_dep
    "Owner" = var.tag_owner
  }
}

resource "aws_default_route_table" "def_rt" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "def-${var.vpc_name}"
    "Dep"  = var.tag_dep
    "Owner" = var.tag_owner
  }
}