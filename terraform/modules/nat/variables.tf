variable "author" {
    description = "Author Name"
    type = string
}

variable "public_subnet_ids" {
    description = "Public Subnets ID's"
    type = list(string)
}