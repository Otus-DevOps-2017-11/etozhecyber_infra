#!/bin/bash

#install Ruby
sudo apt update && sudo apt install -y ruby-full ruby-bundler build-essential



#install mongoDb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list' && \
sudo apt update && sudo apt install -y mongodb-org && \
sudo systemctl enable mongod --now

# Deploy app
git clone https://github.com/Otus-DevOps-2017-11/reddit.git && \
cd reddit && \
bundle install && \
puma -d
