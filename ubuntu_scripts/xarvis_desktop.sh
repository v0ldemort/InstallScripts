
#block usb
chmod 700 /media

#password dependencies
apt-get -y install libpam-pwquality

#install media plugin
#apt-get install -y libdvdcss2 libdvdnav4 libdvdread4

#ssh server
apt install -y openssh-server

#create a director in /etc/scripts and put all scripts in this folder to run without sudo
#mkdir /etc/scripts /manually created

#add a group
addgroup administrator
#add a user to group administrator 'post install'
#usermod -a -G administrator $username

#allow user of group 'administrator' to run scripts in this folder to run without sudo
#%administrator  ALL=(ALL) NOPASSWD:/etc/scripts/

#install docker

apt-get remove docker docker-engine docker.io containerd runc
rm -rf /var/lib/docker
apt-get -y updatesudo
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get -y update

apt-get install -y docker-ce docker-ce-cli containerd.io
docker run hello-world

#duplicati backup docker image
docker pull duplicati/duplicati

_________________
#java
apt-get update -y
apt-get install -y default-jdk
apt-get install -y default-jre

#intellij
snap install -y intellij-idea-community --classic

#mvn 
apt update -y 
apt install -y maven
#mvn -vscode

#python3
apt update -y
apt install -y software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt install -y python3.7

#pip3
apt install -y python3-pip
apt install -y python-pip
pip3 install -y --upgrade pip

#git
apt-get install -y git

#install vs code
apt remove code && apt autoremove
apt install -y curl
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt update -y
apt install -y code

#install node12
apt-get install -y curl python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | -E bash -
apt-get install -y nodejs
apt-get install -y gcc g++ make
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt update -y
apt install -y yarn

#install npm
apt-get update -y
apt-get install -y nodejs
apt-get install -y npm

#install nvm
apt-get update -y
apt-get install -y build-essential libss1-dev
curl-o-https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
source ~/.profile

#install eclipse
snap install --classic eclipse

#mysql
apt -y update && apt upgrade
apt-get -y install mysql-server
mysql_secure_installation

#chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

#sublime
apt-get remove sublime-text && apt-get autoremove
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt-get update -y
apt-get install -y sublime-text

#vlc
snap install vlc

#screen recorder
snap install simplescreenrecorder


#mkdir /home/$whoami/backup2aws

#ldap configuration
apt -y install ldap-auth-client
auth-client-config -t nss -p lac_ldap
pam-auth-update 
/etc/init.d/nscd restart

#install sophos antivirus
tar -xvzf sav-linux-free-9.tgz
cd sophos-av/
sh ./install.sh
/opt/sophos-av/bin/savdctl enable
/etc/init.d/sav-protect start


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


chmod 0707 /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1" >> /etc/sysctl.conf
chmod 0644 /etc/sysctl.conf
sysctl -p
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.lo.disable_ipv6=1
	
#change ssh port for incoming connection
sed -i 's/#Port 22/Port 3040/g' /etc/ssh/sshd_config

#enable  ubuntu firewall
ufw enable
#allow port for ssh
#ufw allow 3040/tcp
#---------------------------------------------------------------------------

#update and upgrade
apt update -y
apt upgrade -y

apt autoremove -y
apt autoclean -y


	