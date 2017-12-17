#### Установка соединения с someinternalhost в одну команду:
```sh
ssh -A user@bastionIP -t ssh someinternalhostIP
```
или
```sh
ssh -A -J user@bastionIP user@someinternalhostIP
```
#### Доп задание
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

#### Сетевые реквизиты
Хост bastion, 
IP: 35.189.198.21 
внутр IP: 10.132.0.2. 

Хост someinternalhost, 
внутр IP: 10.132.0.3
