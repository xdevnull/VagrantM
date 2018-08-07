#!/usr/bin/env bash

echo -e "\n---  Update Package List... ---\n"
apt-get update

echo -e "\n---  Update System Packages... ---\n"
apt-get -y upgrade

echo -e "\n---  Force Locale... ---\n"
echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
locale-gen en_US.UTF-8

echo -e "\n---  Install NodeJS, Build Tools... ---\n"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y gcc g++ make build-essential nodejs

echo -e "\n---  Install MySQL... ---\n"
debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'
apt-get install -y mysql-server

# Add Timezone Support To MySQL
service mysql restart

# Enable Swap Memory
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1