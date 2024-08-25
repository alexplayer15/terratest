variable "main_vpc_id" {
    type = string
    description = "main vpc id"
}

variable "allow_all_port" {
  description = "Port that allows all traffic"
  type        = string
}

variable "allow_all_protocol" {
  description = "Protocol that allows all traffic"
  type        = string
}

variable "allow_all_CIDR" {
  description = "CIDR block that allows all traffic"
  type        = string
}
