variable "terratest_subnet_id_2" {
  type = string
  description = "subnet id for subnet containing instance"
}

variable "allow_all_sg_id" {
    type = string 
    description = "allow all sg id"
}

variable "environment" {
  type = string 
  description = "workspace environment the user is in"
}

variable "instance_type" {
  type = string 
  description = "instance type used by web server"
}

variable "instance_types" {
  type = map(string)
  description = "instance types to use depending on environment"
  default = {
    dev = "t2.micro",
    prod = "t3.micro"
  }
}

