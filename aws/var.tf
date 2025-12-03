variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = list(string)
}

variable "private_subnet_cidr" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "tags" {
  type = map(string)
  default = {
  }
}

variable "region" {
  type = string
}

#Ec2

variable "no_of_ec2" {
  type = number
}

variable "ami_id" {
  type = string
}

variable "key_name" {
  type = string
  default = "Jenkins"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "ec2_tags" {
  type = map(string)
  default = {
  }
}