output "jenkins_lb_dns" {
    value = aws_lb.jenkins_lb.dns_name
}