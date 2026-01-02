output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_id" {
  value = [for subnet in aws_subnet.public : subnet.id]
}

output "private_id" {
  value = [for subnet in aws_subnet.private : subnet.id]
}

output "database_id" {
  value = [for subnet in aws_subnet.database : subnet.id]
}

output "nat_id" {
  value = aws_nat_gateway.nat.id
}

output "igw_id" {
  value = aws_internet_gateway.this.id
}

output "public_rt"{
  value = aws_route_table.public.id
}

output "private_rt"{
  value = aws_route_table.private.id
}
output "database_rt" {
  value = aws_route_table.database.id
}


