#!/bin/bash
sudo apt-get update
sudo chown -R gitlab-runner:gitlab-runner /home/gitlab-runner/
sudo apt-get update && sudo apt-get install -y -q --no-install-recommends
sudo apt-get install -y apt-transport-https \
     && apt-get install -y build-essential \
     && apt-get install -y ca-certificates \
     && apt-get install -y libssl-dev curl
sudo apt-get install -y software-properties-common python-software-properties
sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs \
     && apt-get install -y gcc g++ make
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update 
sudo apt-get install -y yarn
sudo chown -R gitlab-runner:gitlab-runner /home/gitlab-runner/

##Java 8
sudo apt-get install -y openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#git clone https://github.com/v0ldemort/ubuntu.git
#cd ubuntu
#sudo bash maven_3.6.3.sh

##Maven
sudo rm -rf /opt/maven
set -e
# script to install maven

# todo: add method for checking if latest or automatically grabbing latest
mvn_version=${mvn_version:-3.6.3}
url="http://www.mirrorservice.org/sites/ftp.apache.org/maven/maven-3/${mvn_version}/binaries/apache-maven-${mvn_version}-bin.tar.gz"
install_dir="/opt/maven"

if [ -d ${install_dir} ]; then
	    mv ${install_dir} ${install_dir}.$(date +"%Y%m%d")
    fi

    mkdir ${install_dir}
    curl -fsSL ${url} | tar zx --strip-components=1 -C ${install_dir}

    cat << EOF > /etc/profile.d/maven.sh
    #!/bin/sh
    export MAVEN_HOME=${install_dir}
    export M2_HOME=${install_dir}
    export M2=${install_dir}/bin
    export PATH=${install_dir}/bin:$PATH
EOF

    source /etc/profile.d/maven.sh

    echo maven installed to ${install_dir}
    mvn --version

    printf "\n\nTo get mvn in your path, open a new shell or execute: source /etc/profile.d/maven.sh\n"

source /etc/profile.d/maven.sh

#sudo chown -R gitlab-runner:gitlab-runner /usr/local/nvm
#sudo chmod 0777 /usr/local/nvm
#sudo touch ~/.bashrc
#export NVM_DIR=/usr/local/nvm
#export NODE_VERSION=12
#sudo chown -R gitlab-runner:gitlab-runner /home/gitlab-runner/
#source ~/.bashrc
#sudo chown gitlab-runner:gitlab-runner ~/.bashrc
#sudo chown -R gitlab-runner:gitlab-runner /usr/local/nvm
#cd /usr/local/nvm
#- sudo curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh /var/jenkins_home/.nvm | bash && . $NVM_DIR/nvm.sh
#echo $NODE_DIR
#sudo apt-get -qq -y install wget #install wget
#wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash #install nvm
#export NVM_DIR="$NVM_DIR" && . "$NVM_DIR/nvm.sh" --no-use #load nvm
#eval "[ -f .nvmrc ] && nvm install || nvm install stable" #install node
#sudo chown gitlab-runner:gitlab-runner /usr/local/nvm
#sudo chown -R gitlab-runner:gitlab-runner /home/gitlab-runner/
#source ~/.bashrc
#sudo cat ~/.bashrc
##Install NVM
#nvm install $NODE_VERSION \
#    && nvm alias default $NODE_VERSION \
#    && nvm use 12

#export NODE_PATH=$NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules:$PATH
#export PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
#source ~/.bashrc
#cd /home/gitlab-runner/builds/YnQyLHNs/0/streamflux-dev/streamflux/
#echo $JAVA_HOME
#echo $PATH
#echo $NVM_DIR
#whoami
#pwd
#source ~/.bashrc
#nvm install 12
#nvm use 12

