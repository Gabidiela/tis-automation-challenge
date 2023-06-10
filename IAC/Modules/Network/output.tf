output "vpc_id" {
  value = aws_vpc.ec2_vpc.id
}

output "private_subnet_1a" {
  value = aws_subnet.ec2_subnet_private_1a.id
}

output "private_subnet_1b" {
  value = aws_subnet.ec2_subnet_private_1b.id
}