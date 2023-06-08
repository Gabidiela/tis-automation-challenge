resource "aws_subnet" "ec2_subnet_public_1a" {

  vpc_id                  = aws_vpc.ec2_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = format("%sa", var.region)
  map_public_ip_on_launch = true

  tags = {
    Name = format("%s-subnet-public-1a", var.vpc_name)
  }

}

resource "aws_subnet" "ec2_subnet_public_1b" {
  vpc_id                  = aws_vpc.ec2_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = format("%sb", var.region)
  map_public_ip_on_launch = true

  tags = {
    Name = format("%s-subnet-public-1b", var.vpc_name)
  }

}
