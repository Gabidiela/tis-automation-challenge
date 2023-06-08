resource "aws_internet_gateway" "ec2_ig" {
  vpc_id = aws_vpc.ec2_vpc.id

  tags = {
    Name = format("%s-internet-gateway", var.vpc_name)
  }

}
