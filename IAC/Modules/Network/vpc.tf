resource "aws_vpc" "ec2_vpc" {
  cidr_block            = "10.0.0.0/16"

  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = format("%s-vpc",var.vpc_name)
  }
}