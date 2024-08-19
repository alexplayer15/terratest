variable "route53_zone_name" {
    type = string 
    description = "name of the hosted zone record"
}

variable "subdomain"{
    type = string 
    description = "name of the subdomain used for terratest"
}

variable "lb_dns_name" {
   type = string 
   description = "name of the dns zone used by the load balancer"
}

variable "lb_zone_id" {
  type = string 
  description = "dns zone id of load balancer"
}