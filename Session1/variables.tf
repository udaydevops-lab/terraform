variable "sg-name" {
    type = string
    default = "allow_public_all"  
}

variable "sg-description" {
  type = string
  default = "allow TLS inbound traffic"
}

variable "inbound-from-port" {
  default = 0
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}

