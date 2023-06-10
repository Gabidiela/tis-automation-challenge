resource "aws_internet_gateway" "ec2_ig" {
  vpc_id = aws_vpc.ec2_vpc.id

  tags = {
    Name = format("%s-internet-gateway", var.vpc_name)
  }

}

resource "aws_route_table" "ec2_public_rt" {
  vpc_id = aws_vpc.ec2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ec2_ig.id
  }

  tags = {
    Name = format("%s-public-rt", var.vpc_name)
  }

}