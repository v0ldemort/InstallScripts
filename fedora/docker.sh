sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# On Fedora 22 and above install the docker package:
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# To start the Docker service use:
sudo systemctl start docker

# Now you can verify that Docker was correctly installed and is running by running the Docker hello-world image.
sudo docker run hello-world

# To make Docker start when you boot your system, use the command:
sudo systemctl enable docker

# Add your local user to docker group:
sudo gpasswd -a ${USER} docker && sudo systemctl restart docker

echo "Docker has been installed"

######

# Optional step to Install docker-compose

read -p "Do you want to install docker-copose as well [yes/no]: " var1

if [ "$var1" = "yes" ]
   then
      sudo curl -SL https://github.com/docker/compose/releases/download/v2.7.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
      sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
      docker-compose --version
      echo "Docker-Compose has been installed successfully"
    else
      exit 0
fi
