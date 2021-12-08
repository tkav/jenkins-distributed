#!/bin/bash

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt install default-jre -y
apt install default-jdk -y

apt install jenkins -y
sed -i 's/HTTP_PORT=8080/HTTP_PORT=80/g' /etc/default/jenkins

wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
java -jar jenkins.war --httpPort=80


# apt install openjdk-11-jre-headless -y
# wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
# java -jar jenkins.war --httpPort 80

# # Install docker
# apt-get update
# apt-get install -y apt-transport-https ca-certificates curl software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"
# apt-get update
# apt-get install -y docker-ce
# usermod -aG docker ubuntu

# # Install docker-compose
# curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose

# chmod 666 /var/run/docker.sock

# JENKINS_HOME=/opt/jenkins_home

# # Create and set correct permissions for Jenkins mount directory
# mkdir -p $JENKINS_HOME
# chmod -R 777 $JENKINS_HOME

# # Start Jenkins
# docker run -id --name jenkins -p 80:8080 -p 50000:50000 -v $JENKINS_HOME:/var/jenkins_home jenkins/jenkins