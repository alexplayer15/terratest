resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all traffic"
  vpc_id      = var.main_vpc_id

  ingress {
    description      = "all all traffic in"
    from_port        = local.allow_all_port
    to_port          = local.allow_all_port
    protocol         = local.allow_all_protocol
    cidr_blocks      = [local.allow_all_CIDR]
  }

  egress {
    description = "allow all traffic out"
    from_port        = local.allow_all_port
    to_port          = local.allow_all_port
    protocol         = local.allow_all_protocol
    cidr_blocks      = [local.allow_all_CIDR]
  }

}
