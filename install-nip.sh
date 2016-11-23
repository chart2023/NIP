#!/bin/bash
log_file="/home/ubuntu/install-log.txt"
[ -f "$log_file" ] || touch "$log_file"
exec 1>> $log_file 2>&1
#sudo apt-get update
sudo bash -c "echo 127.0.1.1 `cat /etc/hostname` >> /etc/hosts"
wget -q --tries=10 --timeout=20 --spider  http://archive.ubuntu.com
if [[ $? -eq 0 ]]; then
        echo "Online"
else
        echo "Offline"
        exit 0
fi
sudo apt-get install language-pack-en-base -y
sudo locale-gen en_US en_US.UTF-8 cy_GB.UTF-8
sudo apt-get install make gcc libssl-dev g++ unzip -y
NODEJS="http://192.168.9.14:8080/v1/AUTH_133fcd4d81354b0a909bc23e94047c84/openmtc/node-v0.10.42.tar.gz" 
wget $NODEJS --tries=10 --timeout=20 --output-document=/home/ubuntu/node-v0.10.42.tar.gz
if [[ $? -eq 0 ]]; then
        echo "NODEJS is downloaded"
        tar -zxvf /home/ubuntu/node-v0.10.42.tar.gz -C /opt/
        cd /opt/node-v0.10.42/
        ./configure && make && sudo make install
        apt-get install build-essential -y
        npm -g install npm@2.7.6
else
        echo "Cannot download NODEJS"
        exit 0
fi
NIP="http://192.168.9.14:8080/v1/AUTH_133fcd4d81354b0a909bc23e94047c84/openmtc/OpenMTC-nip8081.zip"
wget $NIP --tries=10 --timeout=20 --output-document=/home/ubuntu/OpenMTC-nip.zip
if [[ $? -eq 0 ]]; then
        echo "NIP is downloaded"
        unzip /home/ubuntu/OpenMTC-nip.zip -d /
        cp /opt/openbaton/scripts/start-nip.sh /etc/init.d/start-nip.sh
        chmod ugo+x /etc/init.d/start-nip.sh
        update-rc.d start-nip.sh defaults
else
        echo "Cannot download NIP"
        exit 0
fi
