locals {
    public_subnet_map = {
        for idx, az in var.availability_zones :
        idx => {
            az = az
            cidr = "10.0.${idx * 2 + 1}.0/24"
        }
    }

    private_subnet_map = {
        for idx, az in var.availability_zones :
        idx => {
            az = az
            cidr = "10.0.${idx * 2}.0/24"
        }
    }
}


resource "aws_subnet" "public_subnets" {
    for_each = local.public_subnet_map
    vpc_id = var.vpc_id
    cidr_block = each.value.cidr
    availability_zone = each.value.az
    map_public_ip_on_launch = true

    tags = {
        Name = "public_${each.value.cidr}_${each.value.az}"
        Author = var.author
    }
}

resource "aws_subnet" "private_subnets" {
    for_each = local.private_subnet_map
    vpc_id = var.vpc_id
    cidr_block = each.value.cidr
    availability_zone = each.value.az
    map_public_ip_on_launch = false

    tags = {
        Name = "private_${each.value.cidr}_${each.value.az}"
        Author = var.author
    }
}