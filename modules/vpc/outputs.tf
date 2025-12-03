output "vpc_id" {
  value = aws_vpc.MAIN.id
}
output "security_group_id" {
  value = aws_security_group.common_sg.id
}

output "public_subnets" {
  value = [for s in aws_subnet.public-subnet : s.id ]
}

output "private_subnets" {
  value = [for s in aws_subnet.private-subnet : s.id ]
}