#!/bin/bash
log_file="/home/ubuntu/install-log.txt"
[ -f "$log_file" ] || touch "$log_file"
exec 1>> $log_file 2>&1
#sudo apt-get update
sudo apt-get install language-pack-en-base -y
sudo locale-gen en_US en_US.UTF-8 cy_GB.UTF-8
sudo apt-get install mongodb make subversion expect -y
sudo apt-get install gcc libssl-dev g++ make -y
wget --tries=10 -O - http://192.168.9.11:8080/v1/AUTH_ab1d7ed610574164b21c22f9b542998a/openmtc/node-v0.10.42.tar.gz -o /home/ubuntu/ | tar -xz
cd /home/ubuntu/node-v0.10.42/
./configure && make && sudo make install
cd ..
sudo npm -g install npm@2.7.6
wget --tries=10 http://192.168.9.11:8080/v1/AUTH_ab1d7ed610574164b21c22f9b542998a/openmtc/OpenMTC-nscl.zip -O /home/ubuntu/
unzip OpenMTC-nscl.zip
