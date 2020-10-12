#!/bin/bash

#kafka
sudo apt update
sudo apt install default-jdk
sudo wget http://www-us.apache.org/dist/kafka/2.2.1/kafka_2.12-2.2.1.tgz
tar xzf kafka_2.12-2.2.1.tgz
sudo mkdir /usr/local/kafka
mv kafka_2.12-2.2.1 /usr/local/kafka
cd /usr/local/kafka
bin/zookeeper-server-start.sh config/zookeeper.properties