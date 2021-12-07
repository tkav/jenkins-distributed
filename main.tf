
module "jenkins_security_group" {
  source = "./modules/jenkins/security_group"

  project_name     = var.project_name
}

module "jenkins_master" {
  source = "./modules/jenkins/master"

  instance_size    = "t3.micro"
  project_name     = var.project_name
  security_groups  = [module.jenkins_security_group.security_group_id]
}

module "jenkins_nodes" {
  source = "./modules/jenkins/node"

  node_count       = 3
  instance_size    = "t3.micro"
  project_name     = var.project_name
  security_groups  = [module.jenkins_security_group.security_group_id]
}