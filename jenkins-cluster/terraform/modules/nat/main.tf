resource "aws_eip" "nat_eip" {
    domain = "vpc"

    tags = {
        Name = "jenkins-eip"
        Author = var.author
    }
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = var.public_subnet_ids[1]

    tags = {
        Name = "jenkins-nat"
        Author = var.author
    }
}