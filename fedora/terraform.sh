#!/bin/bash


sudo dnf -y update

# Install required packages
#sudo dnf install -y curl unzip
sudo dnf install -y dnf-plugins-core

# Add terraform package from hashicorp to Linux Repository
#sudo curl https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip -O
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

#Install Terraform
sudo dnf -y install terraform

# Terraform version
terraform version
