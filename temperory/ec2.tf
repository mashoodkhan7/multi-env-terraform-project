provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}

# Use your existing security group ID
variable "security_group_id" {
  default = "sg-024939f0ca5a07026"

}

# Use your existing key pair name (Jenkins.pem)
variable "key_name" {
  default = "java-app"
}

resource "aws_instance" "ec2_nodes" {
  provider      = aws.use1
  count         = 3
  ami           = "ami-0ecb62995f68bb549"    
  instance_type = "t2.medium"
  key_name      = "java-app"

  vpc_security_group_ids = [var.security_group_id]

  tags = {
  Name = "${count.index == 0 ? "master-node" : "worker-node-${count.index}"}"
  }

}
