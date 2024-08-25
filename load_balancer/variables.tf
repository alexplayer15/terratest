variable "terratest_subnet_id" {
    type = string 
    description = "subnet to host lb for terratest"
}

variable "terratest_subnet_id_2" {
    type = string 
    description = "second subnet to host lb for terratest"
}

variable "main_vpc_id" {
    type = string
    description = "main vpc id"
}

variable "web_server_id" {
    type = string 
    description = "id of ec2 instance"
}

variable "allow_all_sg_id" {
    type = string
    description = "sg allowing all traffic in and out"
}

variable "http_port" {
  description = "HTTP port"
  type        = string
}

variable "http_protocol" {
  description = "HTTP protocol"
  type        = string
}