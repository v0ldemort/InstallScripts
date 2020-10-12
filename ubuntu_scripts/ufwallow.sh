echo "enter port number : "
read port
sudo ufw allow $port/tcp
sudo ufw status
