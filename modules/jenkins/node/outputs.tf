output "public_dns" {
  value = aws_instance.jenkins_node[*].public_dns
}