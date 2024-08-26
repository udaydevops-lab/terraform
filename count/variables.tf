variable "instance_name" {
  default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","dispatch","web"]
}

variable "instance_type" {
    type = list
    default =  ["t2.micro", "t3.small"]
}

variable "ami_id" {
  default = "ami-03265a0778a880afb"
}

variable "zone_id" {
  default = "Z03560812NP4EOT6GJFUZ"
}

variable "domain_name" {
    default = "prajai.online"
}