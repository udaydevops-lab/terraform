resource "aws_instance" "count_roboshop" {
  #count         = 11 # count.index is special variable to use like loop 
  count = length(var.instance_name)
  instance_type = locals.instance_type
  ami           = var.ami_id
  tags = {
    instance_name = "locals"
  }
}