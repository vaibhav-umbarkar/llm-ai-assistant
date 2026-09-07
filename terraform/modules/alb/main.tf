resource "aws_lb" "llm_ai_alb" {
    name = "llm-ai-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [var.alb_sg_id]
    subnets = var.public_subnet_ids

    tags = {
        Name = "LLM-AI-Application_Load_Balancer"
        Author = var.author
    }
}

resource "aws_lb_target_group" "alb_tg_gp" {
    name_prefix = "tg-"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    target_type = "instance"

    health_check {
      path = "/"
      interval = 30
      timeout = 5
      healthy_threshold = 2
      unhealthy_threshold = 3
      matcher = "200-399"
    }
}

resource "aws_lb_target_group_attachment" "alb_attach" {
    target_group_arn = aws_lb_target_group.alb_tg_gp.arn
    target_id = var.cluster_instance_id
    port = 80

    depends_on = [aws_lb_target_group.alb_tg_gp]
}

resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_lb.llm_ai_alb.arn
    port = 80
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.alb_tg_gp.arn
    }
}