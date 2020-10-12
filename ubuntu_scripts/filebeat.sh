wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

sudo echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
apt-transport-https

sudo apt update

sudo apt install filebeat
sudo sed -i '148s/#output/output/' /etc/filebeat/filebeat.yml
sudo sed -i '150s/hosts/#hosts/' /etc/filebeat/filebeat.yml
sudo sed -i '24s/false/true/' /etc/filebeat/filebeat.yml
sudo sed -i '162s/#output.logstash:/output.logstash:/' /etc/filebeat/filebeat.yml
sudo sed -i '163s/#hosts/hosts/' /etc/filebeat/filebeat.yml
sudo sed -i '160s/localhost/10.201.14.32/' /etc/filebeat/filebeat.yml
sudo systemctl enable filebeat
sudo systemctl start filebeat
