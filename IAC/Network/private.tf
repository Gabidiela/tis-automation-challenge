resource "aws_subnet" "ec2_subnet_private_1a" {

  vpc_id            = aws_vpc.ec2_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = format("%sa", var.region)

  tags = {
    Name = format("%s-subnet-private-1a", var.vpc_name)
  }

}

resource "aws_subnet" "ec2_subnet_private_1b" {

  vpc_id            = aws_vpc.ec2_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = format("%sb", var.region)

  tags = {
    Name = format("%s-subnet-private-1b", var.vpc_name)
  }

}
