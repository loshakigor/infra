#!/bin/bash

sudo yum install -y mc
sudo yum install -y git
sudo yum install -y ansible
sudo yum install -y nano
sudo mv /tmp/config/id_rsa /home/loshakigor/.ssh/id_rsa
sudo chmod 600 /home/loshakigor/.ssh/id_rsa
cd /home/loshakigor/
sudo mkdir ansible

sudo mv /tmp/config/ansible/* ~/ansible/

sudo yum install -y  https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum install -y  postgresql96-server
sudo /usr/pgsql-9.6/bin/postgresql96-setup initdb

sudo systemctl enable postgresql-9.6
sudo systemctl start postgresql-9.6

sudo yum install -y epel-release
sudo yum install -y nginx
sudo mv -f /tmp/config/zabbix/nginx.conf /etc/nginx/nginx.conf
sudo systemctl start nginx
sudo systemctl enable nginx
sudo firewall-cmd --zone=public --permanent --add-service=http
sudo firewall-cmd --zone=public --permanent --add-service=https
sudo firewall-cmd --reload
#sudo echo net.ipv6.conf.all.disable_ipv6 = 1 >>/etc/sysctl.conf
#sudo echo net.ipv6.conf.default.disable_ipv6 = 1 >>/etc/sysctl.conf
sudo rpm -Uvh https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64/zabbix-release-4.4-1.el7.noarch.rpm
sudo yum clean all
sudo yum install -y zabbix-server-pgsql zabbix-agent
sudo yum install -y zabbix-web-pgsql zabbix-nginx-conf
sudo -u postgres psql -c "CREATE USER zabbix WITH PASSWORD 'zabbix';"
sudo -u postgres psql -c "create database zabbix with owner=zabbix ;"
sudo zcat /usr/share/doc/zabbix-server-pgsql-4.4.8/create.sql.gz | sudo -u zabbix psql zabbix
sudo mv -f /tmp/config/zabbix/zabbix.conf /etc/php-fpm.d/zabbix.conf
sudo mv -f /tmp/config/zabbix/zabbix_server.conf /etc/zabbix/zabbix_server.conf
sudo mv -f /tmp/config/zabbix/pg_hba.conf  /var/lib/pgsql/9.6/data/pg_hba.conf
sudo setenforce 0
sudo systemctl restart zabbix-server zabbix-agent nginx php-fpm
sudo systemctl enable zabbix-server zabbix-agent nginx php-fpm
mkdir /home/loshakigor/.ansible/roles
git clone https://github.com/dj-wasabi/ansible-zabbix-agent.git /home/loshakigor/.ansible/roles/ansible-zabbix-agent
sudo yum install -y python-pip










