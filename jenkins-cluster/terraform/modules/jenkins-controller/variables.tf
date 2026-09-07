variable "private_subnet_ids" {
    type = list(string)
}

variable "jenkins_controller_ami" {
    type = string
}

variable "jenkins_controller_instance_type" {
    type = string
}

variable "jenkins_controller_key_name" {
    type = string
}

variable "jenkins_controller_sg_id" {
    type = string
}

variable "author" {
    type = string
}