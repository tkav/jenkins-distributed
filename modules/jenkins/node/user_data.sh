#!/bin/bash

add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
apt-get -y install openjdk-8-jdk
update-alternatives --config java
apt-get -y install git
useradd -m jenkins
echo "jenkins:jenkins" | chpasswd
keytool -importkeystore -srckeystore /etc/ssl/certs/java/cacerts -destkeystore /etc/ssl/certs/java/cacerts.jks -deststoretype JKS -srcstorepass changeit -deststorepass changeit -noprompt
mv /etc/ssl/certs/java/cacerts.jks /etc/ssl/certs/java/cacerts
/var/lib/dpkg/info/ca-certificates-java.postinst configure