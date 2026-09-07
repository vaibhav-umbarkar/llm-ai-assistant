locals {
    public_subnet_map = {
        for idx, subnet_id in var.public_subnet_ids :
        idx => subnet_id
    }

    private_subnet_map = {
        for idx, subnet_id in var.private_subnet_ids :
        idx => subnet_id
    }
}

# Public Route Table
resource "aws_route_table" "public_rt" {
    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.igw_id
    }

    tags = {
        Name = "public-route-table"
        Author = var.author
    }
}

# Public Route Table Association
resource "aws_route_table_association" "public_assoc" {
    for_each = local.public_subnet_map
    subnet_id = each.value
    route_table_id = aws_route_table.public_rt.id
}


# Private Route Table
resource "aws_route_table" "private_rt" {
    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = var.nat_id
    }

    tags = {
        Name = "private-route-table"
        Author = var.author
    }
}

# Private Route Table
resource "aws_route_table_association" "private_assoc" {
    for_each = local.private_subnet_map
    subnet_id = each.value
    route_table_id = aws_route_table.private_rt.id
}