sudo apt update
export MAVEN_VERSION=3.6.3
sudo wget https://downloads.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
sudo mv apache-maven-$MAVEN_VERSION-bin.tar.gz /opt/
cd /opt/
sudo tar -xvzf apache-maven-$MAVEN_VERSION-bin.tar.gz
sudo ln -s /opt/apache-maven-$MAVEN_VERSION /opt/maven
sudo touch /etc/profile.d/maven.sh
sudo chmod 0707 /etc/profile.d/maven.sh
sudo echo "export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile.d/maven.sh
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn -version
