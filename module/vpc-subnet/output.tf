
output "subnet_ids" {
  value = { for k, v in aws_subnet.subnet : k => v.id }
}

output "subnet_id_sub1" {
  value = aws_subnet.subnet["sub1"].id
}
