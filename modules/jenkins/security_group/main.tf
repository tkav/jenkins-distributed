
resource "aws_security_group" "jenkins_sg" {
  name        = "${var.project_name}-access"
  description = "Allow SSH"

  ingress {
    description      = "Port 80 from my IP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["${data.external.my_ip.result.my_ip}/32"]
  }

  ingress {
    description      = "Port 50000 from my IP"
    from_port        = 50000
    to_port          = 50000
    protocol         = "tcp"
    cidr_blocks      = ["${data.external.my_ip.result.my_ip}/32"]
  }

  ingress {
    description      = "SSH from my IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${data.external.my_ip.result.my_ip}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.project_name}-access"
  }
}
