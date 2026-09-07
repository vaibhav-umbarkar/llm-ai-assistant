resource "aws_instance" "jenkins_controller" {
    ami = var.jenkins_controller_ami
    instance_type = var.jenkins_controller_instance_type
    key_name = var.jenkins_controller_key_name
    vpc_security_group_ids = [var.jenkins_controller_sg_id]
    subnet_id = var.private_subnet_ids[0]

    tags = {
        Name = "jenkins-controller"
        Author = var.author
    }
}
