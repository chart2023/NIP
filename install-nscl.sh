#!/bin/bash
log_file="/home/ubuntu/install-log.txt"
[ -f "$log_file" ] || touch "$log_file"
exec 1>> $log_file 2>&1
#sudo apt-get update
sudo bash -c "echo 127.0.1.1 `cat /etc/hostname` >> /etc/hosts"
sudo apt-get install language-pack-en-base -y
sudo locale-gen en_US en_US.UTF-8 cy_GB.UTF-8
sudo apt-get install mongodb make subversion expect -y
sudo apt-get install gcc libssl-dev g++ make unzip -y
wget --tries=10 -O - http://192.168.9.14:8080/v1/AUTH_7adc3134a4d44870b6d0151584eacf39/openmtc/node-v0.10.42.tar.gz | tar -xz
cd /node-v0.10.42/
./configure && make && sudo make install
cd ..
sudo apt-get install -y build-essential
sudo npm -g install npm@2.7.6
wget --tries=10 http://192.168.9.14:8080/v1/AUTH_7adc3134a4d44870b6d0151584eacf39/openmtc/OpenMTC-nscl.zip -O /home/ubuntu/OpenMTC-nscl.zip
unzip /home/ubuntu/OpenMTC-nscl.zip
sudo cp /opt/openbaton/scripts/start-nscl.sh /etc/init.d/start-nscl.sh
sudo chmod ugo+x /etc/init.d/start-nscl.sh
sudo update-rc.d start-nscl.sh defaults
