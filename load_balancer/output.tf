# output "lb_dns_name" {
#   value = aws_lb.terratest_lb.dns_name
# }

# output "lb_zone_id" {
#   value = aws_lb.terratest_lb.zone_id
# }

output "lb_url" {
  value = aws_lb.terratest_lb.dns_name
}

