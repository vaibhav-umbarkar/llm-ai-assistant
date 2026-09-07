output "bastion_host_public_ip" {
    value = module.bastion_host.bastion_host_public_ip
}

output "jenkins_controller_private_ip" {
    value = module.jenkins_controller.jenkins_controller_private_ip
}

output "jenkins_lb_dns" {
    value = module.jenkins_lb.jenkins_lb_dns
}
