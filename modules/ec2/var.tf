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

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "ec2_tags" {
  type = map(string)
  default = {
  }
}