resource "aws_instance" "bastion_host" {
    ami = var.bastion_host_ami
    instance_type = var.bastion_instance_type
    key_name = var.bastion_key_name
    vpc_security_group_ids = [var.bastion_sg_id]
    subnet_id = var.public_subnet_ids[1]

    associate_public_ip_address = true

    tags = {
        Name = "bastion_host_instance"
        Author = var.author
    }
}