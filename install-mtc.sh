#!/bin/bash
log_file="/home/ubuntu/install-log.txt"
[ -f "$log_file" ] || touch "$log_file"
exec 1>> $log_file 2>&1
sudo apt-get update
sudo apt-get install mongodb make subversion expect -y
sudo apt-get install gcc libssl-dev g++ make -y
wget -qO - http://nodejs.org/dist/v0.10.9/node-v0.10.9.tar.gz | tar -xz
cd node-v0.10.9
./configure && make && sudo make install
cd ..
expect /opt/openbaton/scripts/install-mtc.exp
cd OpenMTC-Chula
sudo make setup
npm install winston
npm install log4js
