resource "aws_vpc" "main" {
  cidr_block       = var.vpc_CIDR
  instance_tenancy = "default"

  tags = {
    Name = "Terratest"
  }
}

resource "aws_subnet" "terratest_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.terratest_subnet_CIDR
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Terratest"
  }
}

resource "aws_subnet" "terratest_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.terratest_subnet_CIDR_2
  availability_zone = "eu-west-2b"

    tags = {
    Name = "Terratest_2"
  }
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
    Name = "Terratest"
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