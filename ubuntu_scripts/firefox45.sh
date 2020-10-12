sudo apt-get -y update
sudo apt-get -y upgrade

#download version 45
wget https://ftp.mozilla.org/pub/firefox/releases/45.0/linux-x86_64/en-US/firefox-45.0.tar.bz2

tar -xjf firefox-45.0.tar.bz2

sudo rm -rf  /opt/firefox

sudo mv firefox /opt/firefox45

sudo mv /usr/bin/firefox /usr/bin/firefoxold

sudo ln -s /opt/firefox45/firefox /usr/bin/firefox

firefox --version