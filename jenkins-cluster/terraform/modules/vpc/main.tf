resource "aws_vpc" "jenkins_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags  = {
    Name = var.vpc_name
    Author = var.author
  }
}