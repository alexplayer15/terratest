variable "terratest_subnet_CIDR" {
    type = string 
    description = "subnet to host lb for terratest"
}

variable "terratest_subnet_CIDR_2" {
    type = string 
    description = "second subnet to host lb for terratest"
}

variable "vpc_CIDR" {
    type = string 
    description = "VPC to host lb for terratest"
}