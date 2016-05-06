#!/bin/bash
log_file="/home/ubuntu/install-node.txt"
[ -f "$log_file" ] || touch "$log_file"
exec 1>> $log_file 2>&1
#wget --tries=10 -O - http://192.168.9.11:8080/v1/AUTH_ee10034eae5a462daa29e6f9f2738e8e/openmtc/node-v0.10.42.tar.gz | tar -xz
#cd /node-v0.10.42/
#./configure && make && sudo make install
#cd ..
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
sudo apt-get install -y npm
sudo npm -g install npm@2.7.6
sudo ln -s /usr/bin/nodejs /usr/bin/node
