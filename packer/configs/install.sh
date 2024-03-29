#!/usr/bin/env bash

apt update
apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common \
    ufw bash-completion htop

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update
apt-cache policy docker-ce
apt -y install docker-ce docker-ce-cli containerd.io

dc_version=$(curl -sI "https://github.com/docker/compose/releases/latest" | grep 'location:' | sed 's/.*tag\///g')
curl -L "https://github.com/docker/compose/releases/download/$dc_version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
systemctl enable docker

ufw allow ssh
ufw allow http
ufw allow https
ufw enable
