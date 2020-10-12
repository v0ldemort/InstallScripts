#!/bin/bash

sudo apt autoremove node nodejs nodejs-legacy npm
sudo purge node nodejs nodejs-legacy npm
sudo rm -rf /usr/local/bin/npm 
sudo rm -rf /usr/local/bin/npx
sudo rm -rf /usr/lib/node_modules/
sudo rm -rf /usr/bin/npm
sudo rm -r /usr/local/lib/node_modules/
sudo rm -rf /usr/local/bin/node
sudo rm -rf /usr/bin/npm
sudo rm -rf /usr/lib/node_modules/
rm -rf /home/exadatum/.npm/
rm -rf /home/exadatum/node*
rm -rf /home/exadatum/.node-gyp/
sudo rm -rf /root/.npm/
sudo rm /usr/bin/node
sudo rm -rf /usr/local/include/node

wget http://nodejs.org/dist/latest/node-v11.13.0-linux-x64.tar.gz
sudo tar --strip-components 1 -xzvf node-v* -C /usr/local

node --version
npm --version
