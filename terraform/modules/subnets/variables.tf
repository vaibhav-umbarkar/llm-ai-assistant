variable "public_availability_zones" {
    description = "Public Subnets Availablity Zones"
    type = list(string)
}

variable "private_availability_zones" {
  description = "Private Subnets Availablity Zones"
  type = list(string)
}

variable "vpc_id" {
    description = "VPC ID for subnets"
    type = string
}

variable "author" {
    description = "Author Name"
    type = string
}