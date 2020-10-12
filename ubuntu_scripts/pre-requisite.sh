#!/bin/bash

#block usb
sudo chmod 700 /media

#password dependencies
sudo apt-get update
sudo apt-get -y install libpam-pwquality

# CONFIGURE PASSWORD EXPIRY
sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   30/' /etc/login.defs
sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS   7/' /etc/login.defs
sed -i 's/^PASS_WARN_AGE.*/PASS_WARN_AGE   3/' /etc/login.defs


# CONFIGURE PASSWORD COMPLEXITY
cat >> /etc/pam.d/common-password <<'EOF'
#
# /etc/pam.d/common-password - password-related modules common to all services
#
# This file is included from other service-specific PAM config files,
# and should contain a list of modules that define the services to be
# used to change user passwords.  The default is pam_unix.

# Explanation of pam_unix options:
#
# The "sha512" option enables salted SHA512 passwords.  Without this option,
# the default is Unix crypt.  Prior releases used the option "md5".
#
# The "obscure" option replaces the old `OBSCURE_CHECKS_ENAB' option in
# login.defs.
#
# See the pam_unix manpage for other options.

# As of pam 1.0.1-6, this file is managed by pam-auth-update by default.
# To take advantage of this, it is recommended that you configure any
# local modules either before or after the default block, and use
# pam-auth-update to manage selection of other modules.  See
# pam-auth-update(8) for details.

# here are the per-package modules (the "Primary" block)
password	[success=1 default=ignore]	pam_unix.so sha512 use_authtok try_first_pass remember=10
# here's the fallback if no module succeeds
password	requisite			pam_cracklib.so retry=5 gecoscheck=1 minlen=10 lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1 difok=3 reject_username maxsequence=2 maxrepeat=3
# prime the stack with a positive return value if there isn't one already;
# this avoids us returning an error just because nothing sets a success code
# since the modules above will each just jump around
password	required			pam_permit.so
# and here are more per-package modules (the "Additional" block)
password	optional	pam_gnome_keyring.so 
# end of pam-auth-update config
EOF

echo "Password Policy Updated"

#add a user
echo "enter username : "
read username
sudo adduser $username
#sudo echo "$username   ALL=(ALL:ALL) ALL" >> /etc/sudoers

#disable ipv6
sudo chmod 0707 /etc/sysctl.conf
sudo echo "net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1" >> /etc/sysctl.conf
sudo chmod 0644 /etc/sysctl.conf
sudo sysctl -p
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1

#chrome
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

#Java & Openssh
sudo apt-get install -y openjdk-8-jdk  \
     && apt-get install -y openssh-server


#change ssh port for incoming connection
#sudo sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config

# MySQL
sudo apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 5072E1F5 \
    && echo "deb http://repo.mysql.com/apt/ubuntu/ xenial mysql-5.7" | tee -a /etc/apt/sources.list.d/mysql.list \
    && apt-get update \
    && echo "mysql-server mysql-server/root_password password root" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections \
    && apt-get install -y mysql-server

# Docker
sudo apt-get -y update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get -y update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
sudo usermod -aG docker $USERNAME

