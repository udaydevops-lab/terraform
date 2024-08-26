resource "aws_instance" "count_roboshop" {
  count         = 11 # count.index is special variable to use like loop 
  instance_type = var.instance_name[count.index] == "mongodb" || var.instance_name[count.index] == "mysql" || var.instance_name[count.index] == "redis" ? "t3.small" : "t2.micro"
  ami           = var.ami_id
  tags = {
    instance_name = var.instance_name[count.index]
  }
}

resource "aws_route53_record" "domain" {
  count = 11
  zone_id = var.zone_id
  name    = "${var.instance_name[count.index]}.${var.domain_name}" # interpolation
  type    = "A"
  ttl     = 1
  records = [var.instance_name[count.index] == "web" ? aws_instance.count_roboshop[count.index].public_ip : aws_instance.count_roboshop[count.index].private_ip]
}
