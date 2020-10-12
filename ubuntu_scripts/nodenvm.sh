#!/bin/bash
sudo apt-get update

# install openjdk and other required packages.
sudo chown -R streamflux.streamflux /home/streamflux
sudo apt-get update && sudo apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        libssl-dev
sudo apt-get install -y curl
sudo apt-get install -y software-properties-common
#sudo apt-get install -y curl python-software-properties
sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y gcc g++ make
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update 
sudo apt-get install -y yarn
sudo chown -R streamflux.streamflux /home/streamflux

#Java 8
sudo apt-get install -y openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

##Install base dependencies
#USER jenkins
sudo apt-get update && sudo apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        libssl-dev
sudo mkdir /usr/local/nvm
sudo chown -R streamflux:streamflux /usr/local/nvm
sudo touch ~/.bashrc
export NVM_DIR=/usr/local/nvm
export NODE_VERSION=12
sudo chown -R streamflux.streamflux /home/streamflux
source ~/.bashrc
sudo chown streamflux:streamflux ~/.bashrc
sudo chown -R streamflux:streamflux /usr/local/nvm

cd /usr/local/nvm
sudo curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh /var/jenkins_home/.nvm | bash \
    && . $NVM_DIR/nvm.sh \

sudo chown streamflux:streamflux /usr/local/nvm
sudo chown -R streamflux.streamflux /home/streamflux
#Install NVM
nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use 12
sudo chown -R $USER:$(id -gn $USER) /home/streamflux/.config
export NODE_PATH=$NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules:$PATH
export PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

echo "restart the terminal to take effect"
