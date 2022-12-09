#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y
apt-get install apache2 -y
systemctl enable apache2
systemctl start apache2
apt install unzip -y
mkdir /tmp/projeto2
cd /tmp/projeto2
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -rfv ./* /var/www/html/

