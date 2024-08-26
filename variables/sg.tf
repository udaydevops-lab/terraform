resource "aws_security_group" "allow_all" {

  name        = var.sg-name
  description = var.sg-description

  ingress {
    description = "Allow All ports"
    from_port   = var.inbound-from-port
    to_port     = var.inbound-from-port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = var.inbound-from-port
    to_port     = var.inbound-from-port
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = "roboshop-all-aws"
  }

}
