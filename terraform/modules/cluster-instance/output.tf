output "cluster_instance_private_ip" {
    value = aws_instance.cluster_instance.private_ip
}

output "cluster_instance_id" {
    value = aws_instance.cluster_instance.id
}