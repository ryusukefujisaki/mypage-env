#!/bin/bash

set -eux

sudo dnf update -y
sudo dnf install -y python3-pip
pip3 install awscli --user
# aws configure
sudo dnf install -y nodejs
sudo npm install -g npm
sudo dnf module enable -y nodejs:16
sudo dnf module install -y nodejs:16
sudo npm install -g aws-cdk

sudo sed -i -e 's/^mirrorlist/#mirrorlist/g' \
     -e 's/^#baseurl=http:\/\/mirror/baseurl=http:\/\/vault/g' \
     /etc/yum.repos.d/CentOS-*repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker

sudo curl -L "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(uname -m)" \
     -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo gpasswd -a vagrant docker

docker-compose -f /home/vagrant/mypage-env/docker-compose.yml build --no-cache
docker-compose -f /home/vagrant/mypage-env/docker-compose.yml up -d
