
resource "aws_security_group" "tf_security_group" {
  name        = "${var.app_name}-security-group"
  description = "${var.app_name} security group"
  vpc_id      = data.aws_vpc.default.id // get vpc id

  ingress {
    from_port        = 0
    to_port          = 65535
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    tags = {
        "Name" = "${var.app_name}"
  }

}