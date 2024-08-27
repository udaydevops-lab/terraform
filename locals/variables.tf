variable "isProd" {
    type = bool
    default = false
  
}

variable "instance_name" {
    type = list
   default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","dispatch","web"]
}

variable "ami_id" {
  default = "ami-0b4f379183e5706b9"
}

variable "zone_id" {
  default = "Z03560812NP4EOT6GJFUZ"
}

variable "domain_name" {
    default = "prajai.online"
}