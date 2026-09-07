variable "private_subnet_ids" {
    description = "Private Subnet ID's"
    type = list(string)
}

variable "cluster_instance_ami" {
    description = "Cluster Instance AMI"
    type = string
}

variable "cluster_instance_type" {
    description = "Cluster Instance Type"
    type = string
}

variable "cluster_instance_key_name" {
    description = "Cluster Instance Key Name"
    type = string
}

variable "cluster_instance_sg_id" {
    description = "Cluster Instance Security Group"
    type = string
}


variable "author" {
    description = "Author Name"
    type = string
}