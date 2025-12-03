region = "us-east-1"

vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]  
azs = ["us-east-1a","us-east-1b"]
tags = {
    Environment = "Dev"
}
ami_id = "ami-0360c520857e3138f"
instance_type = "t2.micro"
key_name = "common-ec2"
no_of_ec2=1

ec2_tags = {
  Environment = "Dev"
}

