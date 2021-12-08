output "jenkins_master_address" {
  value = module.jenkins_master.public_dns
}

output "jenkins_node_address" {
  value = module.jenkins_nodes[*].public_dns
}