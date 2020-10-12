echo "enter port number : "
read port
sudo ufw deny $port/tcp
sudo ufw status
