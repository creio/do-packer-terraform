#!/usr/bin/env bash

user_name=cretm
C_PASS="1"
PASSWORD=$(/usr/bin/openssl passwd -crypt "$C_PASS")

useradd -m -g users -G "sudo,docker" -s /usr/bin/bash "$user_name"
usermod -p ${PASSWORD} "$user_name"

apt install -y ranger

curl -L "https://raw.githubusercontent.com/creio/dots/master/.ssh/id_rsa.pub" -o /tmp/authorized_keys
mv /tmp/authorized_keys /root/.ssh/authorized_keys
cp -r ~/.ssh /home/$user_name
chown -R $user_name:users /home/$user_name/.ssh

run_user() {
  sudo -u $user_name "$@"
}

## bitnami discourse
# run_user mkdir -p /home/$user_name/app/discourse
# run_user curl -L "https://raw.githubusercontent.com/bitnami/bitnami-docker-discourse/master/2/debian-10/docker-compose.yml" -o /home/$user_name/app/discourse/docker-compose.yml
# mv /tmp/docker-compose-discourse.yml /home/$user_name/app/discourse/docker-compose.yml
# chown -R $user_name:users /home/$user_name/app

## https://github.com/discourse/discourse/blob/master/docs/INSTALL-cloud.md
git clone https://github.com/discourse/discourse_docker.git /var/discourse
