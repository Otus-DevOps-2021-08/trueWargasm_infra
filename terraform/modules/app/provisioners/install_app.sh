#!/bin/sh


apt-get update
sleep 30
apt-get install -y git
sleep 30
mkdir /redditapp
chown ubuntu /redditapp

ls -al /
echo $DATABASE_URL
