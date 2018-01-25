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
# Homework-10
## Базовая часть

Все сделано по описанию - установлен ansible с помощью файла [requirements.txt](./ansible/requirements.txt)

```
sudo pip install -r requirements.txt
```
Далее было поднято тестовое откружение, созданы inventory файлы (
[ini](./ansible/inventory) и [yml](./ansible/inventory.yml)),
проверен ping до хостов

# Homework-11

## Подготовлены следующие ansible playbooks:
***reddit-app-one-play.yml*** - все задачи в одном файле и в одном сценарии, при запуске нужно ограничивать по тегу и группе хостов:
```ansible-playbook reddit-app-one-play.yml --limit app --tags app-tag```

***reddit-app-multiple-plays.yml*** - все задачи в одном файле и в множестве сценариев; при запуске достаточно ограничить только по тегу:
```ansible-playbook reddit-app-multiple-plays.yml --tags app-tag```

***site.yml + app.yml + db.yml + deploy.yml*** - каждый сценарий в своем файле, есть объединяющий сценарий. Запускать можно как отдельные сценарии, так и сводный файл для полного цикла деплоя.

***packer-app.yml, packer-db.yml*** - плейбуки для Packer, заменяющие скрипты установки ПО для сервера приложений и сервера БД. Используются при подготовке образа с помощью Packer:
```packer build -var-file=./variables-app.json app.json```
