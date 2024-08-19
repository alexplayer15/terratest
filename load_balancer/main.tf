resource "aws_lb" "terratest_lb" {
  name = "example-${var.route53_zone_id}"
  internal           = false
  load_balancer_type = "application"
  subnets = [aws_subnet.terratest_subnet.id,aws_subnet.terratest_subnet_2.id]

  tags = {
    Name = "example-lb-${var.route53_zone_id}"
  }
  enable_deletion_protection = false 
}

resource "aws_lb_listener" "http_terratest_listener" {
  load_balancer_arn = aws_lb.terratest_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Hello, world"
      status_code  = "200"
    }
  }

  depends_on = [aws_lb.terratest_lb]
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_CIDR
  instance_tenancy = "default"

  tags = {
    Name = "Terratest"
  }
}

resource "aws_subnet" "terratest_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_CIDR
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Terratest"
  }
}

resource "aws_subnet" "terratest_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_CIDR_2
  availability_zone = "eu-west-2b"
}

resource "aws_internet_gateway" "pubsub_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Terratest"
  }
}

resource "aws_route_table" "public_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.allow_all_CIDR
    gateway_id = aws_internet_gateway.pubsub_igw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.terratest_subnet.id
  route_table_id = aws_route_table.public_table.id
}

resource "aws_route_table_association" "public_association_2" {
  subnet_id      = aws_subnet.terratest_subnet_2.id
  route_table_id = aws_route_table.public_table.id
}