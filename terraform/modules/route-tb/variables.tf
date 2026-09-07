variable "public_subnet_ids" {
    description = "Public Subnets ID"
    type = list(string)
}

variable "private_subnet_ids" {
    description = "Private Subnets ID"
    type = list(string)
}

variable "vpc_id" {
    description = "VPC ID"
    type = string
}

variable "igw_id" {
    description = "Internet Gateway ID"
    type = string
}

variable "nat_id" {
    description = "NAT Gateway ID"
    type = string
}

variable "author" {
    description = "Author Name"
    type = string
}