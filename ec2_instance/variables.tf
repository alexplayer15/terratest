variable "terratest_subnet_id" {
  type = string
  description = "subnet id for subnet containing instance"
}

variable "allow_all_sg_id" {
    type = string 
    description = "allow all sg id"
}

variable "instance_type" {
  type = string 
  description = "instance type used by web server"
}

