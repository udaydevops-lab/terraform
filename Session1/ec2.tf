# terraform sysntax

# resource "resource_name" (aws resource name) "terraform_resource_name" (our_wish {
# key = value
# }


resource "aws_instance" "tf_instance" {

  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.allow_all.id ]

  tags = {
    Name = "Hello"
    Env  = "practice"
  }

}

resource "aws_security_group" "allow_all" {

  name        = "allow_all"
  description = "open to public"

  ingress {
    description = "TLS from VPC"
    from_port   = var.inbound-from-port
    to_port     = var.inbound-from-port
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_blocks]
  }

  tags = {
    Name = "public.sg"
  }

}
