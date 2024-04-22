resource "aws_lb" "lb" {
  depends_on = [ aws_security_group.tf_security_group ]
  name               = "${var.app_name}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tf_security_group.id]
  subnets            = data.aws_subnets.all.ids
  tags = {
    Environment = var.app_name,
    "Name" = "${var.app_name}"
 
  }
}