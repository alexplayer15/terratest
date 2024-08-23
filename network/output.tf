output "terratest_subnet_id" {
  value = aws_subnet.terratest_subnet.id
}

output "terratest_subnet_id_2" {
  value = aws_subnet.terratest_subnet_2.id
}

output "main_vpc_id" {
    value = aws_vpc.main.id
}