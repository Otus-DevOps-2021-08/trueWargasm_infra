# trueWargasm_infra
trueWargasm Infra repository

Для доступа во внутреннюю VM с одной командой можно добавить конфиг SSH

```
Host YcOtusInfra_bastion
   HostName 62.84.122.247
   User wargasm
   IdentityFile ~/.ssh/yc_otus_rsa
Host YcOtusInfra_internal
   HostName 62.84.122.247
   User wargasm
   IdentityFile ~/.ssh/yc_otus_rsa
   ForwardAgent yes
   RequestTTY force
   RemoteCommand ssh 10.129.0.35
```

``` $ ssh YcOtusInfra_internal ``` залогинит пользователя в интернал

https://62-84-122-247.sslip.io/login
```
user: pritunl
pass: Ve4PsbgD2a03
```
bastion_IP = 62.84.122.247

someinternalhost_IP = 10.129.0.35
