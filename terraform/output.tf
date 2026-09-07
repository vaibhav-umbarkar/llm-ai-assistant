output "bastion_host_public_ip" {
    value = module.bastion-host.bastion_host_public_ip
}

output "cluster_instance_private_ip" {
    value = module.cluster-instance.cluster_instance_private_ip
}

output "cluster_lb_dns" {
    value = module.alb.cluster_lb_dns
}