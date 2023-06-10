resource "aws_security_group" "ec2_sg" {
  name        = format("%s-sg", var.vpc_name)
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
  }
}

resource "aws_security_group_rule" "ec2_sg_ingress_rule" {    
    security_group_id = aws_security_group.ec2_sg.id
    type = "ingress"

    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

}