resource "aws_eip" "ec2_eip" {
  vpc = true
  
  tags = {
    "Name" = format("%s-elastic-ip", var.vpc_name)
  }

}

resource "aws_nat_gateway" "ec2_nat_gw" {
  allocation_id = aws_eip.ec2_eip.id
  subnet_id     = aws_subnet.ec2_subnet_public_1a.id

  tags = {
    Name = format("%s-nat-gateway", var.vpc_name)
  }

}

resource "aws_route_table" "ec2_nat_rt" {
  vpc_id = aws_vpc.ec2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ec2_nat_gw.id
  }

  tags = {
    Name = format("%s-private-rt", var.vpc_name)  
  }

}