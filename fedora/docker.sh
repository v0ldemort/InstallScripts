#!/bin/bash

# On Fedora 22 and above install the docker package:
sudo dnf install docker

# To start the Docker service use:
sudo systemctl start docker

# Now you can verify that Docker was correctly installed and is running by running the Docker hello-world image.
sudo docker run hello-world

# To make Docker start when you boot your system, use the command:
sudo systemctl enable docker

# To create the docker group and add your user:
sudo groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart docker

echo "Do you want to restart the machine"

