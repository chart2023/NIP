#!/bin/bash
log_file="/home/ubuntu/install-log.txt"
[ -f "$log_file" ] || touch "$log_file"
exec 1>> $log_file 2>&1
#sudo apt-get update
sudo apt-get install language-pack-en-base -y
sudo locale-gen en_US en_US.UTF-8 cy_GB.UTF-8
sudo apt-get install mongodb make subversion expect -y
sudo apt-get install gcc libssl-dev g++ make unzip -y
wget --tries=10 -O - http://192.168.9.11:8080/v1/AUTH_ee10034eae5a462daa29e6f9f2738e8e/openmtc/node-v0.10.42.tar.gz | tar -xz
cd /node-v0.10.42/
./configure && make && sudo make install
cd ..
sudo npm -g install npm@2.7.6
wget --tries=10 http://192.168.9.11:8080/v1/AUTH_ee10034eae5a462daa29e6f9f2738e8e/openmtc/OpenMTC-nip.zip -O /home/ubuntu/OpenMTC-nip.zip
unzip /home/ubuntu/OpenMTC-nip.zip
