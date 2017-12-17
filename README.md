# Homework-05
##### Установка соединения с someinternalhost в одну команду:
```sh
ssh -A user@bastionIP -t ssh someinternalhostIP
```
или
```sh
ssh -A -J user@bastionIP user@someinternalhostIP
```
##### Доп задание
В фаил .ssh/config добавляем
```
Host bastion
 hostname <bastionIP>
 User <username>

Host someinternalhost
 hostname <someinternalhostIP>
 proxyjump bastion
 user <username>
```
После этого работает **ssh bastion** или **ssh someinternalhost**

##### Сетевые реквизиты
Хост bastion,
IP: 35.189.198.21
внутр IP: 10.132.0.2.

Хост someinternalhost,
внутр IP: 10.132.0.3
# Homework-06 
##### Создание Redditapp instance
```sh
gcloud compute instances create reddit-app \
--boot-disk-size=10GB \
--zone=europe-west1-d \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure  \
--metadata "startup-script-url=https://raw.githubusercontent.com/Otus-DevOps-2017-11/etozhecyber_infra/Infra-2/startup.sh"
