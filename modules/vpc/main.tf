resource "aws_vpc" "MAIN" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = merge(var.tags, { Name = "${var.tags["Environment"]}-vpc"} )
  
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.MAIN.id

  tags = {
    Name = "${var.tags["Environment"]}-igw"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id   = aws_vpc.MAIN.id
  for_each = { for idx, cidr in var.public_subnet_cidr : idx => cidr }
  cidr_block = each.value
  availability_zone = var.azs[tonumber(each.key)%length(var.azs)]
  map_public_ip_on_launch = true
 
  tags = merge(var.tags, { Name = "${var.tags["Environment"]}-public_subnet-${each.key}"})
}

resource "aws_subnet" "private-subnet" {
  vpc_id   = aws_vpc.MAIN.id
  for_each = { for idx, cidr in var.private_subnet_cidr : idx => cidr }
  cidr_block = each.value
  availability_zone = var.azs[tonumber(each.key)%length(var.azs)]
 
  tags = merge(var.tags, { Name = "${var.tags["Environment"]}-private_subnet-${each.key}"})
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.MAIN.id
  tags = merge(var.tags, { Name = "${var.tags["Environment"]}-public-rt"})
  
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  for_each = aws_subnet.public-subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "common_sg" {
  vpc_id = aws_vpc.MAIN.id
  description = "Allow SSH & HTTPS"
  tags = {
    Name = "${var.tags["Environment"]}-common-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.common_sg.id
  cidr_ipv4         = aws_vpc.MAIN.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
  
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.common_sg.id
  cidr_ipv4         = aws_vpc.MAIN.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.common_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}
