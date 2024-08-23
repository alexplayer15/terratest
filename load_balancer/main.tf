resource "aws_lb" "terratest_lb" {
  name = "terratest-lb"
  internal           = false
  load_balancer_type = "application"
  subnets = [var.terratest_subnet_id, var.terratest_subnet_id_2]
  security_groups    = [var.allow_all_sg_id]

  tags = {
    Name = "Terratest"
  }
  enable_deletion_protection = false 

  depends_on = [
    var.terratest_subnet_id, var.terratest_subnet_id_2
  ]
}

resource "aws_lb_listener" "http_terratest_listener" {
  load_balancer_arn = aws_lb.terratest_lb.arn
  port              = local.http_port
  protocol          = local.http_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terratest-tg.arn
  }
}

resource "aws_lb_target_group" "terratest-tg" {
  name     = "terratest-tg"
  port     = local.http_port
  protocol = local.http_protocol
  vpc_id   = var.main_vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}

resource "aws_lb_target_group_attachment" "terratest-tga" {
  target_group_arn = aws_lb_target_group.terratest-tg.arn
  target_id        = var.web_server_id
  port             = 80
}