output "ami_id" {
  value = data.aws_ami.cent-os.id
}

output "vpc_id" {
  value = data.aws_vpc.default
}

# give the correct ami name in data.tf and the uncomment the below it will give the output when plan or apply

# output "aws_ami_id" {
#   value = data.aws_ami.aws-linux-2.id
# }