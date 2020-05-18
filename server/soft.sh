#!/bin/bash

sudo yum install -y mc
sudo yum install -y git
sudo yum install -y ansible
sudo yum install -y nano
sudo mv /tmp/config/id_rsa /home/loshakigor/.ssh/id_rsa
sudo mv /tmp/config/docker/bashrc  /home/loshakigor/.bashrc
sudo mv /tmp/config/docker/Dockerfile /home/loshakigor/Dockerfile
sudo mv /tmp/config/docker/default.conf /home/loshakigor/default.conf
sudo chmod 600 /home/loshakigor/.ssh/id_rsa
cd /home/loshakigor/
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io	
sudo systemctl start docker



