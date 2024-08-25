variable "route53_zone_name" {
    type = string 
    description = "name of the hosted zone record"
}

variable "subdomain"{
    type = string 
    description = "name of the subdomain used for terratest"
}

variable "vpc_CIDR" {
    type = string 
    description = "VPC to host lb for terratest"
}

variable "terratest_subnet_CIDR" {
    type = string 
    description = "subnet to host lb for terratest"
}

variable terratest_subnet_CIDR_2 {
    type = string 
    description = "second subnet to host lb for terratest"
}

variable route53_zone_id {
    type = string 
    description = "zone id"
}

variable "instance_type" {
    type = string 
    description = "instance type used by web server"
}