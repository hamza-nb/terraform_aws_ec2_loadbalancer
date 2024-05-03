data "aws_route53_zone" "route53_zone_info" {
  name         = "${var.domain_name}."
#   private_zone = true
}

resource "aws_route53_record" "add_certif_record_to_route53" {
  depends_on = [ aws_acm_certificate.cert ]
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.route53_zone_info.zone_id
}

resource "aws_route53_record" "route53_lb" {
  depends_on = [ aws_lb.lb ]
  zone_id = data.aws_route53_zone.route53_zone_info.zone_id
  name    = "${var.app_name}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_lb.lb.dns_name
    zone_id                = aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}
