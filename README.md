# trueWargasm_infra
trueWargasm Infra repository

Для доступа во внутреннюю VM с одной командой можно добавить конфиг SSH

```
Host YcOtusInfra_bastion
   HostName 178.154.218.116
   User wargasm
   IdentityFile ~/.ssh/yc_otus_rsa
Host YcOtusInfra_internal
   HostName 178.154.218.116
   User wargasm
   IdentityFile ~/.ssh/yc_otus_rsa
   ForwardAgent yes
   RequestTTY force
   RemoteCommand ssh 10.128.0.11
```

``` $ ssh YcOtusInfra_internal ``` залогинит пользователя в интернал