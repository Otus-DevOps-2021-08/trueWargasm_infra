#!/bin/sh

cd /redditapp

git clone -b monolith https://github.com/express42/reddit.git

cd reddit && bundle install
echo "SETUP"
echo $DATABASE_URL
