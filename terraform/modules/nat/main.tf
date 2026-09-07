resource "aws_eip" "nat_eip" {
    domain = "vpc"

    tags = {
        Name = "Elastic-IP"
        Author = var.author
    }
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = var.public_subnet_ids[0]

    tags = {
        Name = "NAT-Gateway"
        Author = var.author
    }
}