variable "vpc_CIDR" {
    type = string 
    description = "VPC to host lb for terratest"
}

variable "subnet_CIDR" {
    type = string 
    description = "subnet to host lb for terratest"
}

variable "subnet_CIDR_2" {
    type = string 
    description = "second subnet to host lb for terratest"
}

variable "allow_all_CIDR" {
    default = "0.0.0.0/0"
}

variable "route53_zone_id" {
  description = "Route 53 Zone ID"
  type        = string
}