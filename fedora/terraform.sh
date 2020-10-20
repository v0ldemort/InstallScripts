#!/bin/bash


sudo dnf -y update

# Install required packages
sudo dnf install -y curl unzip

# Download terraform package from hashicorp
sudo curl https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip -O

# Extract the downloaded package
unzip terraform_0.13.4_linux_amd64.zip

# Required permission
chmod +x terraform

# Move to bin directory
sudo mv terraform /usr/bin/

# Terraform version
terraform version

