data "aws_route53_zone" "terratest_domain" {
  name         = var.route53_zone_name
  private_zone = false
}

resource "aws_route53_record" "terratest_subdomain" {
  zone_id = data.aws_route53_zone.terratest_domain.zone_id
  name    = "${var.subdomain}.${var.route53_zone_name}"
  type    = "A"

  alias {
    name                   = var.lb_dns_name
    zone_id                = var.lb_zone_id
    evaluate_target_health = true
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [zone_id]
  }

  depends_on = [data.aws_route53_zone.terratest_domain]
}