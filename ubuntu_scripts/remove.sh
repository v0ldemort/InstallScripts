#remove python
sudo apt-get autoremove libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
sudo apt-get purge libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
sudo apt autoremove -y python*
sudo apt purge -y python*
sudo rm -rf /etc/python*
sudo rm -rf /usr/bin/python*
sudo rm -rf /usr/lib/python*
sudo rm -rf /usr/local/lib/python*
sudo rm -rf /usr/include/python*
sudo rm -rf /usr/share/python*
sudo rm -rf /usr/share/man/man1/python*

#remove eclipse
sudo snap remove eclipse*
sudo snap purge eclipse*
sudo snap remove eclipse --classic
sudo rm -rf /usr/bin/eclipse*
sudo rm -rf /usr/lib/eclipse*
sudo rm -rf /usr/share/eclipse*


#sudo rm -rf ~/anaconda3
conda install anaconda-clean
#anaconda-clean
anaconda-clean --yes
sudo rm -rf ~/anaconda3
