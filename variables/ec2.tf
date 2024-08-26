resource "aws_instance" "web" {

    ami = var.ami_id
    security_groups = [aws_security_group.allow_all.id]
    instance_type = var.instance_type
    tags = var.tags
  
}