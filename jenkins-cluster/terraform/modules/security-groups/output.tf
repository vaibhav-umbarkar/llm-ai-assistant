output "bastion_sg_id" {
    value = aws_security_group.bastion_sg.id
}

output "jenkins_controller_sg_id" {
    value = aws_security_group.jenkins_controller_sg.id
}

output "jenkins_agent_sg_id" {
    value = aws_security_group.jenkins_agent_sg.id
}

output "alb_sg_id" {
    value = aws_security_group.alb_sg.id
}