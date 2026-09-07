output "cluster_lb_dns" {
    value = aws_lb.llm_ai_alb.dns_name
}