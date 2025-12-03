module "aws_root" {
  source = "../../../aws"  # points to root module , needed to store state files per env
  region = var.region
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  azs = var.azs
  tags = var.tags
  no_of_ec2 = var.no_of_ec2
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  ec2_tags = var.ec2_tags
}
