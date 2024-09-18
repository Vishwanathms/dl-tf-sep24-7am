
resource "random_integer" "sub_number" {
  count = length(var.subnets)
  min = 7
  max = 9

}

resource "random_shuffle" "subnet_ids" {
  input = range(7, 9)  
  result_count = length(var.subnets)  
}


resource "aws_subnet" "subnet" {
  for_each = var.subnets
  vpc_id = var.vpc_ids[var.location]
  cidr_block = each.value
  tags = {
    "Name" = each.key
    "Dep"  = var.tag_dep
    "Owner" = var.tag_owner
  }
}


resource "aws_subnet" "subnet" {
  for_each = var.subnets
  vpc_id = var.vpc_ids[var.location]
  cidr_block = each.value[1]
  availability_zone = each.value[2]
  tags = {
    "Name" = each.value[0]
    "Dep"  = var.tag_dep
    "Owner" = var.tag_owner
  }
}
