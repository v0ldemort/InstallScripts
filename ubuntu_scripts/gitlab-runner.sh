sudo mkdir ../git_runner
cd ../git_runner
sudo curl -LJO https://s3.amazonaws.com/gitlab-runner-downloads/master/deb/gitlab-runner_amd64.deb
sudo dpkg -i gitlab-runner_amd64.deb
sudo gitlab-runner start
sudo gitlab-runner register
sudo gitlab-runner start

