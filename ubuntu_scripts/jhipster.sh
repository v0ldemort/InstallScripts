#!/bin/bash

#install Java

#install node12
sudo apt-get install -y curl python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y gcc g++ make
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn

#install yo
sudo npm install -g yo@latest

#update npm
sudo npm install -g npm

#install jhipster
sudo npm install -g generator-jhipster

