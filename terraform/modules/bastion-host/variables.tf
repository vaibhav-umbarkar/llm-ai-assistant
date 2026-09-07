variable "bastion_host_ami" {
    description = "Bastion Host AMI"
    type = string
}

variable "bastion_instance_type" {
    description = "Bastion Instance Type"
    type = string
}

variable "bastion_key_name" {
    description = "Bastion pem Key Name"
    type = string
}

variable "bastion_sg_id" {
    description = "Bastion Security Group ID"
    type = string
}

variable "public_subnet_ids" {
    description = "Public Subnet ID for Bation Host"
    type = list(string)
}

variable "author" {
    description = "Author Name"
    type = string
}