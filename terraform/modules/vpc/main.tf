resource "aws_vpc" "llm_ai_vpc" {
    cidr_block = var.vpc_cidr_block
    enable_dns_hostnames = true

    tags = {
        Name = "App-VPC"
        Author = var.author
    }
}