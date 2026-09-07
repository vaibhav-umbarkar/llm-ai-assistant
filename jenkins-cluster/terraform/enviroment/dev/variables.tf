variable "region" {
    description = "The AWS region to create resources in"
    type        = string
}

variable "author" {
    description = "Dev name value"
    type = string
}

variable "vpc_name" {
    description = "VPC name value"
    type = string
}

variable "vpc_cidr_block" {
    description = "VPC CIDR block value"
    type = string
}

variable "public_subnets_count" {
    description = "Number of public subnets"
    type = number
}

variable "private_subnets_count" {
    description = "Number of private subnets"
    type = number
}

variable "availability_zones" {
    description = "List of availability zones"
    type = list(string)
}


variable "bastion_ami" {
    description = "Bastion instance ami"
    type = string
}
variable "bastion_instance_type" {
    description = "Bastion instance type"
    type = string
}
variable "bastion_key_name" {
    description = "Bastion pem key name"
    type = string
}


variable "jenkins_controller_ami" {
    description = "Jenkins master ami"
    type = string
}
variable "jenkins_controller_instance_type" {
    description = "Jenkins master instance type"
    type = string
}
variable "jenkins_controller_key_name" {
    description = "Jenkins master pem key name"
    type = string
}
