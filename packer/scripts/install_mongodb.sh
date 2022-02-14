#!/bin/sh
echo "WGET"
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
echo "apt-get update"
apt-get update
echo "apt-get upgrade"
apt-get upgrade
echo "sleep 30"
sleep 30
echo "wake"
echo "apt install -y mongodb-org"
apt install -y mongodb-org
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
systemctl start mongod
systemctl enable mongod
