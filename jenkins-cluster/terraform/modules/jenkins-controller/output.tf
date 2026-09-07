output "jenkins_controller_id" {
    value = aws_instance.jenkins_controller.id
}

output "jenkins_controller_private_ip" {
    value = aws_instance.jenkins_controller.private_ip
}