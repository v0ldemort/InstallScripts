#!/bin/bash

if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as sudo" 
        exit 1
else
        #Update and Upgrade
        echo "Updating and Upgrading"
        sudo apt-get update && sudo apt-get upgrade -y

        sudo apt-get install dialog -y
        cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
        options=(1 "Sublime Text 3" off    # any option can be set to default to "on"
                 2 "MySQL Server" off
                 3 "Docker" off
                 4 "Git" off
                 5 "Open-SSH Server" off
                 6 "JHipster" off
                 7 "Python" off
                 8 "Chrome" off
                 9 "Google Cloud SDK" off
                 10 "Minikube" off
                 11 "Maven" off
                 12 "NVM" off
                 13 "NODE12" off
                 14 "SCALA" off
                 15 "MySQL Workbench" off
                 16 "Tree" off
                 18 "VSCode" off
                 18 "JDK 8" off)
                choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                clear
                for choice in $choices
                do
                    case $choice in
                    1)
                                #Install Sublime Text 3*
                                echo "Installing Sublime Text"
                                sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
                                sudo apt update
                                sudo apt install sublime-text-installer -y
                                ;;
                    2)
                                ## MySQL Installation
                                ## This Mysql installation script configure latest version of Mysql server
                                ## With default user "root" and password "root"
                                ## You can change passord
                                sudo echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
                                sudo echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
                                sudo apt-get -y install mysql-client mysql-server
                                #service mysql start
                                sudo chown -R mysql:mysql /var/lib/mysql
                                sudo usermod -d /var/lib/mysql/ mysql
                                sudo service mysql restart
                                echo "################## MYSQL-Server is installed now ##################"
                                ;;
                    3)
                                ##Docker
                                sudo apt-get remove docker docker-engine docker.io containerd runc
                                sudo rm -rf /var/lib/docker
                                sudo apt-get -y update
                                sudo apt-get -y install \
                                    apt-transport-https \
                                    ca-certificates \
                                    curl \
                                    gnupg-agent \
                                    software-properties-common
                                curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
                                sudo apt-key fingerprint 0EBFCD88
                                sudo add-apt-repository \
                                  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                                  $(lsb_release -cs) \
                                  stable"
                                sudo apt-get -y update
                                sudo apt-get install docker-ce docker-ce-cli containerd.io -y
                                sudo docker run hello-world
                                sudo usermod -aG docker $USER
                                ;;
                    4)
                                #Git
                                sudo apt-get install git -y
                                ;;
                    5)
                                #openssh-server
                                sudo apt-get install -y openssh-server
                                ;;
                    6)
                                # JHipster
                                #install Java
                                sudo apt-get install -y default-jdk
                                #install node12
                                sudo apt-get install -y curl python-software-properties
                                curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
                                sudo apt-get install -y nodejs
                                sudo apt-get install -y gcc g++ make
                                curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
                                echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
                                sudo apt update
                                sudo apt install -y yarn
                                #install yo
                                sudo npm install -g yo@latest
                                #update npm
                                sudo npm install -g npm
                                #install jhipster
                                sudo npm install -g generator-jhipster
                                ;;
                    7)
                                #python2-3
                                #pip3
                                sudo apt install -y python3-pip
                                sudo apt install -y python-pip
                                sudo pip3 install --upgrade pip
                                ;;
                    8)
                                #Chrome
                                sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                                sudo dpkg -i google-chrome-stable_current_amd64.deb
                                ;;
                    9)
                                #Google Cloud SDK
                                # Add the Cloud SDK distribution URI as a package source
                                echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
                                # Import the Google Cloud Platform public key
                                curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
                                # Update the package list and install the Cloud SDK
                                sudo apt-get update
                                sudo apt-get install google-cloud-sdk -y
                                ;;
                    10)
                                #Minikube && Kubectl
                                sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
                                sudo chmod +x ./kubectl
                                sudo mv ./kubectl /usr/local/bin/kubectl
                                sudo apt-get update && sudo apt-get install -y apt-transport-https
                                sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
                                echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
                                sudo apt-get update
                                sudo apt-get install -y kubectl
                                sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
                                && chmod +x minikube
                                sudo mkdir -p /usr/local/bin/
                                sudo install minikube /usr/local/bin/
                                ;;
                    11)
                                #Maven
                                sudo apt update
                                sudo apt install -y maven
                                ;;
                    12)
                                #NVM
                                sudo apt-get install build-essential libssl-dev
                                sudo curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash
                                source ~/.bashrc
                                nvm --version
                                ;;
                    13)
                                #NODE12
                                sudo apt-get install -y curl python-software-properties
                                curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
                                sudo apt-get install -y nodejs
                                sudo apt-get install -y gcc g++ make
                                curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
                                echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
                                sudo apt update
                                sudo apt install -y yarn
                                node --version
                                ;;
                    14)
                                #SCALA
                                sudo apt-get install scala
                                scala -version
                                ;;
                    15)
                                #MYSQL Workbench
                                sudo apt install mysql-workbench
                                ;;
                    16)
                                #Tree
                                sudo apt-get install tree
                                ;;
                    17)
                                #VSCode
                                sudo apt install curl -y
                                curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
                                sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
                                sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
                                sudo apt update
                                sudo apt install code -y
                                ;;
		    18)
				#JAVA
				sudo apt-get update
				sudo apt-get install -y default-jdk
				;;
                    esac
	   done
fi
