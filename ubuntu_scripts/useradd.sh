echo "enter username : "
read username
sudo adduser $username
sudo usermod -a -G administrator $username
sudo mkdir /home/$username/sys_backup
