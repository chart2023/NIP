#!/bin/bash
log_file="/home/ubuntu/installnip-log.txt"
[ -f "$log_file" ] || touch "$log_file"
exec 1>> $log_file 2>&1
sudo mkdir /OpenMTC-Chula/openmtc-NIP/
sudo mkdir /OpenMTC-Chula/openmtc-NIP/ProxyGateway
sudo git clone https://github.com/chart2023/ProxyGateway.git /OpenMTC-Chula/openmtc-NIP/ProxyGateway/
sudo cp /OpenMTC-Chula/openmtc-NIP/ProxyGateway/config-nscl.js /OpenMTC-Chula/openmtc/settings/
sudo cp /OpenMTC-Chula/openmtc-NIP/ProxyGateway/config-gscl.js /OpenMTC-Chula/openmtc/settings/
sudo mkdir /OpenMTC-Chula/openmtc-NIP/lib
sudo mkdir /OpenMTC-Chula/openmtc-NIP/lib/NIP
sudo cp /OpenMTC-Chula/openmtc-NIP/ProxyGateway/NIP/index.js /OpenMTC-Chula/openmtc-NIP/lib/NIP/
sudo cp /OpenMTC-Chula/openmtc-NIP/ProxyGateway/openmtclib/index.js /OpenMTC-Chula/openmtc/lib/
sudo ln -s /OpenMTC-Chula/openmtc /OpenMTC-Chula/node_modules/
sudo ln -s /OpenMTC-chula/node_modules /OpenMTC-Chula/openmtc-NIP/
#sudo ln -s /OpenMTC-Chula/openmtc /OpenMTC-Chula/openmtc-NIP/node_modules/
