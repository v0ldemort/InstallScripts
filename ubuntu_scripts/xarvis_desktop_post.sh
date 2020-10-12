#block usb
sudo chmod 700 /media

#password dependencies
sudo apt-get -y install libpam-pwquality

______________________________________________
#add a user
echo "enter username : "
read username
sudo adduser $username

#adduser to group addministrator
sudo usermod -a -G administrator $username

#adduser to group docker
sudo usermod -a -G docker $username

#add a directory named sys_backup
sudo mkdir /home/$username/sys_backup
______________________________________________

sudo apt install -y mysql-server
sudo mysql_secure_installation

#ubuntu hardening

#password expiry
#nano /etc/login.defs
# line 160: set 60 for Password Expiration
#PASS_MAX_DAYS 90
# line 161: set 2 for Minimum number of days available
#PASS_MIN_DAYS 2
# line 162: set 7 for number of days for warnings
#PASS_WARN_AGE 7

#password complexity
#nano /etc/pam.d/common-password
# here are the per-package modules (the "Primary" block)        
#password        requisite                pam_cracklib.so retry=5 gecoscheck=1 minlen=10 lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1 difok=3 reject_username maxsequence=2 maxrepeat=3
#password        [success=1 default=ignore]      pam_unix.so obscure use_authtok try_first_pass sha512 remember=10

#disable ipv4
sudo chmod 0707 /etc/sysctl.conf
sudo echo "net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1" >> /etc/sysctl.conf
sudo chmod 0644 /etc/sysctl.conf
sudo sysctl -p
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1

#change ssh port for incoming connection
sudo sed -i 's/#Port 22/Port 3040/g' /etc/ssh/sshd_config

#enable  ubuntu firewall
sudo ufw enable
#allow port for ssh
sudo ufw allow 3040/tcp

#update and upgrade
sudo apt update -y
sudo apt upgrade -y

#unused library removal
sudo apt autoremove -y
sudo apt autoclean -y


echo "You are done with all the post Installation, Welcome to the world of XARVIS"
