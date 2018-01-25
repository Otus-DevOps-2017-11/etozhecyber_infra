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
##### Создание Redditapp instance из скрипта из git'а
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
```
или напрямую цепью комманд
```sh
gcloud compute instances create reddit-app \
--boot-disk-size=10GB \
--zone=europe-west1-d \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure  \
--metadata "startup-script=git clone https://github.com/Otus-DevOps-2017-11/reddit.git && cd reddit && bundle install && puma -d"
```
# Homework 9
## packer
Создано 2 семейства образов из образа `ubuntu-1604-lts`:

 `reddit-app-base` - базовый образ для приложения (с ruby на борту)

 `reddit-db-base` - базовый образ для БД (c mongod на борту)

## terraform
Был создан модуль `vpc`,`app`,`db`.

Создано два конфига для поднятия окружения `stage` и `prod`

