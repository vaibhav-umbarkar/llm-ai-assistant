resource "aws_lb" "jenkins_lb" {
    name = "jenkins-lb"
    internal = false
    load_balancer_type = "application"
    security_groups = [var.alb_sg_id]
    subnets = var.public_subnet_ids

    tags = {
        Name = "jenkins-lb"
        Author = var.author
    }
}

resource "aws_lb_target_group" "alb_tg_gp" {
    name_prefix = "tg-"
    port = 8080
    protocol = "HTTP"
    vpc_id = var.vpc_id
    target_type = "instance"

    health_check {
        path = "/"
        interval = 30
        timeout = 5
        healthy_threshold = 2
        unhealthy_threshold = 2
        matcher = "200-399"

    }
}

resource "aws_lb_target_group_attachment" "alb_attach" {
    target_group_arn = aws_lb_target_group.alb_tg_gp.arn
    target_id = var.jenkins_controller_id
    port = 8080

    depends_on = [aws_lb_target_group.alb_tg_gp]
}

resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_lb.jenkins_lb.arn
    port = 80
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.alb_tg_gp.arn
    }
}