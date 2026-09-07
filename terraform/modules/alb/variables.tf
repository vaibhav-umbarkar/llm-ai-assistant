variable "vpc_id" {
    description = "VPC ID"
    type = string
}

variable "alb_sg_id" {
    description = "ALB Security Group ID"
    type = string
}

variable "public_subnet_ids" {
    description = "Public Subnet ID's"
    type = list(string)
}

variable "author" {
    description = "Author Name"
    type = string
}

variable "cluster_instance_id" {
    description = "Cluster Instance ID"
    type = string
}