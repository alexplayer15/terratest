output web_server_id {
    value = aws_instance.terratest_ec2.id
}

output web_server_ip {
    value = aws_eip.terratest_eip.public_ip
}