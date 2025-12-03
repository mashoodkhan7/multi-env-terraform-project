module "vpc"{
    source = "../modules/vpc"
    vpc_cidr=var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    azs = var.azs
    tags = var.tags
    region = var.region
}

module "ec2"{
    source = "../modules/ec2"
    no_of_ec2 = var.no_of_ec2
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = module.vpc.public_subnets[0]
    security_group_ids = [module.vpc.security_group_id]
    ec2_tags=var.ec2_tags
}