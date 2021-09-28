# trueWargasm_infra

trueWargasm Infra repository

## Reddit instance deploy

```
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=512M \
  --core-fraction=5 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=app-config.yml
```
``` $ ./start_application.sh ```

testapp_IP = 62.84.114.194

testapp_port = 9292