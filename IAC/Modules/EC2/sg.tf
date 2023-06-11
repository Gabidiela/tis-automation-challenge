resource "aws_security_group" "ec2_sg" {
  name        = format("%s-sg", var.project_name)
  description = "Security Group do projeto"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
  egress {
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]
}
}

# resource "aws_security_group_rule" "ec2_sg_ingress_rule" {    
#     security_group_id = aws_security_group.ec2_sg.id
#     type = "ingress"

#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"

# }