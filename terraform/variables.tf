variable "region" {
    description = "Region for infra"
    type = string
}

variable "vpc_cidr_block" {
    description = "LLM AI Assistant VPC CIDR Block"
    type = string
}

variable "vpc_name" {
    description = "Name for VPC"
    type = string
}

variable "author" {
    description = "Author Name"
    type = string
}

variable "public_availability_zones" {
    description = "Public Subnetes Availablity Zones"
    type = list(string)
}

variable "private_availability_zones" {
    description = "Private Subnets Availablity Zones"
    type = list(string)
}

variable "bastion_host_ami" {
    description = "Bastion Host AMI"
    type = string
}

variable "bastion_instance_type" {
    description = "Bastion Instance Type"
    type = string
}

variable "bastion_key_name" {
    description = "Bastion Key Name"
    type = string
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