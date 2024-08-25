terraform {
  backend "s3" {
    bucket         = "terratest-backend"  
    key            = "terraform.tfstate"  
    region         = "eu-west-2"                
    encrypt        = true                   
  }
}

module "web_server" {
  source = "../ec2_instance"
  terratest_subnet_id = module.network.terratest_subnet_id
  allow_all_sg_id = module.security.allow_all_sg_id
  environment = local.environment
  instance_type = local.instance_type
}

# module "load_balancer" {
#   source = "../load_balancer"
#   terratest_subnet_id = module.network.terratest_subnet_id
#   terratest_subnet_id_2 = module.network.terratest_subnet_id_2
#   web_server_id = module.web_server.web_server_id
#   main_vpc_id = module.network.main_vpc_id
#   allow_all_sg_id = module.security.allow_all_sg_id
#   http_port = local.http_port
#   http_protocol = local.http_protocol
# }

# module "dns" {
#   source = "../dns"
#   subdomain = var.subdomain
#   route53_zone_name = var.route53_zone_name
#   lb_zone_id        = module.load_balancer.lb_zone_id
#   lb_dns_name       = module.load_balancer.lb_dns_name
# }

module "network" {
  source = "../network"
  vpc_CIDR = var.vpc_CIDR
  terratest_subnet_CIDR = var.terratest_subnet_CIDR
  terratest_subnet_CIDR_2 = var.terratest_subnet_CIDR_2   
  allow_all_CIDR     = local.allow_all_CIDR
}

module "security" {
  source = "../security"
  main_vpc_id = module.network.main_vpc_id 
  allow_all_CIDR     = local.allow_all_CIDR
  allow_all_port     = local.allow_all_port
  allow_all_protocol = local.allow_all_protocol
}


