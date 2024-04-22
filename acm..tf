resource "aws_acm_certificate" "cert" {
  domain_name       = "${var.app_name}.${var.domain_name}"
  validation_method = "DNS"

  tags = {
    Environment = "${var.app_name}"
  }
}