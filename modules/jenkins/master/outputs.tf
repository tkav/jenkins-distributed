output "public_dns" {
  value = aws_instance.jenkins_master.public_dns
}

output "private_ip" {
  value = aws_instance.jenkins_master.private_ip
}