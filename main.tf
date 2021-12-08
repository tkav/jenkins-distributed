
module "jenkins_security_group" {
  source = "./modules/jenkins/security_group"

  project_name     = var.project_name
}

module "jenkins_master" {
  source = "./modules/jenkins/master"

  key_name         = var.key_name
  instance_size    = "t3.medium"
  project_name     = var.project_name
  security_groups  = [module.jenkins_security_group.security_group_id]
}

resource "aws_security_group" "allow_ssh_from_master" {
  name        = "${var.project_name}-master-access"
  description = "Allow SSH"

  ingress {
    description      = "SSH from jenkins master"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${module.jenkins_master.private_ip}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.project_name}-master-access"
  }
 
  depends_on = [module.jenkins_master]
}

module "jenkins_nodes" {
  source = "./modules/jenkins/node"

  key_name         = var.key_name
  node_count       = 3
  instance_size    = "t3.micro"
  project_name     = var.project_name
  security_groups  = [module.jenkins_security_group.security_group_id, aws_security_group.allow_ssh_from_master.id]
}