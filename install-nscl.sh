#!/bin/bash
NSCL_START_TIME=$(date +%s)
log_file="/home/ubuntu/install-log.txt"
[ -f "$log_file" ] || touch "$log_file"
exec 1>> $log_file 2>&1
#sudo apt-get update
bash -c "echo 127.0.1.1 `cat /etc/hostname` >> /etc/hosts"
apt-get install language-pack-en-base -y
locale-gen en_US en_US.UTF-8 cy_GB.UTF-8
apt-get install mongodb make subversion expect -y
apt-get install gcc libssl-dev g++ make unzip -y
NODEJS="http://192.168.9.14:8080/v1/AUTH_7adc3134a4d44870b6d0151584eacf39/openmtc/node-v0.10.42.tar.gz" 
wget -q --tries=10 --timeout=20 --spider -O $NODEJS | tar -xz
if [[ $? -eq 0 ]]; then
        echo "NODEJS is downloaded"
        cd /node-v0.10.42/
        ./configure && make && sudo make install
        npm -g install npm@2.7.6
else
        echo "Cannot download NODEJS"
        exit 0
fi
NSCL="http://192.168.9.14:8080/v1/AUTH_7adc3134a4d44870b6d0151584eacf39/openmtc/OpenMTC-nscl.zip"
wget -q --tries=10 --timeout=20 --spider -O $NSCL /home/ubuntu/OpenMTC-nscl.zip
if [[ $? -eq 0 ]]; then
        echo "NSCL is downloaded"
        unzip /home/ubuntu/OpenMTC-nscl.zip
        cp /opt/openbaton/scripts/start-nscl.sh /etc/init.d/start-nscl.sh
        chmod ugo+x /etc/init.d/start-nscl.sh
        update-rc.d start-nscl.sh defaults
else
        echo "Cannot download NSCL"
        exit 0
fi

