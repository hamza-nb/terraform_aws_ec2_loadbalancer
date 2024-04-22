resource "aws_lb_target_group" "terraform_target_group" {
  name        = "${var.app_name}-tg"
  port        = 80 
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      =  data.aws_vpc.default.id
  health_check {
    matcher = "200"
    path = "/"
    protocol = "HTTP"
  }
  tags = {
        "Name" = "${var.app_name}"
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
    depends_on = [ aws_lb_target_group.terraform_target_group ]
    target_group_arn = aws_lb_target_group.terraform_target_group.arn
    target_id        = "${var.ec2_target_id}"
    port             = var.app_port
}