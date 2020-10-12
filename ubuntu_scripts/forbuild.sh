#!/bin/bash


#install node12
sudo apt-get install -y curl python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y gcc g++ make
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update 
sudo apt install -y yarn

#install nvm
sudo apt-get update
sudo apt-get install build-essential libssl-dev
curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash
source ~/.profile
source ~/.bashrc
nvm --version

#Java 8
sudo apt-get install openjdk-8-jdk

#install yo
sudo npm install -g yo@latest

#update npm
sudo npm install -g npm

#INstall jhipster
sudo nvm install 12
sudo nvm use 12
sudo npm i -g generator-jhipster@6.1.2


#install maven
#sudo npm install -g generator-jhipster
sudo apt update
export MAVEN_VERSION=3.6.3
sudo wget https://downloads.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
sudo mv apache-maven-$MAVEN_VERSION-bin.tar.gz /opt/
cd /opt/
sudo tar -xvzf apache-maven-$MAVEN_VERSION-bin.tar.gz
sudo ln -s /opt/apache-maven-$MAVEN_VERSION /opt/maven
sudo touch /etc/profile.d/maven.sh
sudo chmod 0707 /etc/profile.d/maven.sh
sudo echo "export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile.d/maven.sh
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
#mvn -version


