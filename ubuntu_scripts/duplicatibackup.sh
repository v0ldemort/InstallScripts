sudo mkdir /home/$USER/backup2aws
docker pull duplicati/duplicati
docker run -p 8200:8200 -v /home/$USER/backup2aws:/data duplicati/duplicati
