output "bastion-sg-id" {
    value = aws_security_group.bastion_sg.id
}

output "alb_sg_id" {
    value = aws_security_group.alb_sg.id
}

output "cluster_sg_id" {
    value = aws_security_group.cluster_instance_sg.id
}