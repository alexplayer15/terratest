resource "aws_instance" "terratest_ec2" {
    ami = "ami-0b25f6ba2f4419235"
    instance_type = var.instance_type
    subnet_id = var.terratest_subnet_id
    vpc_security_group_ids = [var.allow_all_sg_id]

    tags = {
        Name = "terratest_ec2"
    }

    user_data = <<-EOF
        #!/bin/bash
        yum update -y
        yum install -y httpd
        systemctl start httpd
        systemctl enable httpd
        echo "<h1>Hello World Test!</h1>" > /var/www/html/index.html
    EOF
}

resource "aws_eip" "terratest_eip" {
  instance = aws_instance.terratest_ec2.id
  domain   = "vpc"
}