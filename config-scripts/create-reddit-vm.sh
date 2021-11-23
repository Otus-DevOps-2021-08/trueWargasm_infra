#!/bin/sh

yc compute instance create \
 --name reddit-immutable-app \
 --hostname reddit-app \
 --memory=2 \
 --image-folder-id=standard-images,image-family=reddit-full,size=10GB \
 --use-boot-disk=epd0aepe1s0im31tgliu \
 --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
 --public-ip \
 --metadata serial-port-enable=1 \
 --ssh-key ~/.ssh/appuser.pub
