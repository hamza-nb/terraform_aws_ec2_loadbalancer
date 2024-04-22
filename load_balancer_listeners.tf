resource "aws_lb_listener" "http_lb_listener" {
depends_on = [ aws_lb.lb, aws_lb_target_group.terraform_target_group ]

  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform_target_group.arn
  }
  tags = {
    "Name" = "${var.app_name}"
  }
}

resource "aws_lb_listener" "https_lb_listener" {
depends_on = [ aws_lb.lb, aws_lb_target_group.terraform_target_group, aws_route53_record.add_certif_record_to_route53 ]

  load_balancer_arn = aws_lb.lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform_target_group.arn
  }
  tags = {
    "Name" = "${var.app_name}"
  }
}

