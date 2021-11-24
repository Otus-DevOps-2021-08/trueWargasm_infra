#!/bin/sh

apt-get update
apt-get install -y git

mkdir /redditapp
chown ubuntu /redditapp

ls -al /
