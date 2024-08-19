module "load_balancer" {
    source = "../load_balancer"
    vpc_CIDR = var.vpc_CIDR
    subnet_CIDR = var.subnet_CIDR
    subnet_CIDR_2 = var.subnet_CIDR_2
    route53_zone_id = module.dns.route53_zone_id
}

module "dns" {
    source = "../dns"
    subdomain = var.subdomain
    route53_zone_name = var.route53_zone_name
    lb_zone_id        = module.load_balancer.lb_zone_id
    lb_dns_name       = module.load_balancer.lb_dns_name

}

output "route53_zone_id" {
  value = module.dns.route53_zone_id
}
