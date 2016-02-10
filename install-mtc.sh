#!/bin/bash
sudo apt-get update
sudo apt-get install mongodb make subversion expect -y
sudo apt-get install gcc libssl-dev g++ make -y
wget -qO - http://nodejs.org/dist/v0.10.22/node-v0.10.22.tar.gz | tar -xz
cd node-v0.10.22
./configure && make && sudo make install
cd ..
expect /opt/openbaton/scripts/install-mtc.exp
cd OpenMTC-Chula
make setup
npm install winston
