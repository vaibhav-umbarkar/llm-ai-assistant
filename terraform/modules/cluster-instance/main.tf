resource "aws_instance" "cluster_instance" {
    ami = var.cluster_instance_ami
    instance_type = var.cluster_instance_type
    key_name = var.cluster_instance_key_name
    vpc_security_group_ids = [var.cluster_instance_sg_id]
    subnet_id = var.private_subnet_ids[0]

    associate_public_ip_address = false

    tags = {
        Name = "Cluster-Instance"
        Author = var.author
    }
}