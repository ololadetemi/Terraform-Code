provider "aws" {
  region  = "us-east-1"
  profile = "Terraform_file"
}


resource "aws_instance" "Lola_terraform" {
  ami = var.ami_id
  #count      = var.instance_count

  for_each = {
    sea   = "t2.micro"
    dev   = "t2.nano"
    front = "t3.medium"
    port  = "t2.large"
    lol   = "t2.micro"
  }
  #instance_type = var.instance_type
  instance_type = each.value
  key_name      = "temikeypair"

  tags = {
    #Name = var.name [count.index]
    Name = each.key
  }

}

variable "ami_id" {
  default = "ami-0cff7528ff583bf9a"
}

#variable "instance_count" {
#   default = 4
#}

#variable "instance_type" {
# default = "t2.micro"
#}

#variable "name" {
#   default = ["sea","dev","front","port"]
#}