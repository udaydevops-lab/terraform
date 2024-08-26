resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.instance_name == "Mongodb" ? "t2.micro" : "t3.small" 
    
}