variable "bastion_ami" {
    type = string
}

variable "bastion_instance_type" {
    type = string
}

variable "bastion_key_name" {
    type = string
}

variable "bastion_sg_id" {
    type = string
}

variable "public_subnet_ids" {
    type = list(string)
}

variable "author" {
    type = string
}