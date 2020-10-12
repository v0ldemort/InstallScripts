#!/bin/bash

#remove mysql
sudo apt-get purge mysql*
sudo apt-get purge mysql*
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get remove dbconfig-mysql


#mysql server
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 5072E1F5 && echo "deb http://repo.mysql.com/apt/ubuntu/ xenial mysql-5.7" | tee -a /etc/apt/sources.list.d/mysql
.list
apt-get update && echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && echo "mysql-server mysql-server/root_password_again password root" |
 debconf-set-selections
apt-get install -y mysql-server
service mysql restart
mysql_secure_installation <<EOF
root
n
root
root
y
y
y
y
y
EOF
