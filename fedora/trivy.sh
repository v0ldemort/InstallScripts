#!/bin/bash

#Refrence 
#https://aquasecurity.github.io/trivy/v0.18.0/installation/

#Verify the latest Version here - https://github.com/aquasecurity/trivy/releases/


sudo vim /etc/yum.repos.d/trivy.repo
[trivy]
name=Trivy repository
baseurl=https://aquasecurity.github.io/trivy-repo/rpm/releases/$releasever/$basearch/
gpgcheck=0
enabled=1
sudo yum -y update
sudo yum -y install trivy
