# output "lb_url" {
#   value = module.load_balancer.lb_url
# }

output web_server_ip {
  value = module.web_server.web_server_ip
}

# output "route53_zone_id" {
#   value = module.dns.route53_zone_id
# }