locals {
  allow_all_port = "0"
  allow_all_protocol = "-1" 
  allow_all_CIDR = "0.0.0.0/0"
  http_port = "80"
  http_protocol = "HTTP"
  environment = terraform.workspace
  instance_type = lookup(var.instance_types, local.environment, "t2.micro")
}