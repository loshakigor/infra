#!/bin/bash
sudo yum install -y mc
sudo yum install -y git
sudo yum install -y ansible
sudo yum install -y nano
sudo mv /tmp/config/id_rsa /home/loshakigor/.ssh/id_rsa
cd /home/loshakigor/
sudo mkdir ansible
sudo mv /tmp/config/* ~/ansible/
