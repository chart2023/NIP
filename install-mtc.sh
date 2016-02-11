#!/bin/bash
log_file="/home/ubuntu/install-log.txt"
[ -f "$log_file" ] || touch "$log_file"
exec 1>> $log_file 2>&1
sudo apt-get update
sudo apt-get install language-pack-en-base -y
sudo locale-gen en_US en_US.UTF-8 cy_GB.UTF-8
sudo apt-get install mongodb make subversion expect -y
sudo apt-get install gcc libssl-dev g++ make -y
wget -qO - http://nodejs.org/dist/v0.10.42/node-v0.10.42.tar.gz | tar -xz
cd node-v0.10.42
./configure && make && sudo make install
cd ..
sudo npm -g install npm@2.7.6
expect /opt/openbaton/scripts/install-mtc.exp
cd OpenMTC-Chula
sudo make setup
npm install winston
#npm install log4js
