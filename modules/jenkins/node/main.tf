resource "aws_instance" "jenkins_node" {
  count           = var.node_count
  ami                    = "ami-0bf8b986de7e3c7ce"
  instance_type          = var.instance_size
  user_data              = "${file("${path.module}/user_data.sh")}"
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = "${var.project_name}-node-${count.index}"
  }
}