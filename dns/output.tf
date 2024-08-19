output "route53_zone_id" {
    value = data.aws_route53_zone.terratest_domain.zone_id
}