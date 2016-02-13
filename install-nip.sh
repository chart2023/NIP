#!/bin/bash
sudo mkdir /OpenMTC-Chula/openmtc-NIP/
sudo git clone https://github.com/chart2023/ProxyGateway.git /OpenMTC-Chula/openmtc-NIP/
sudo cp /OpenMTC-Chula/openmtc-NIP/ProxyGateway/config-nscl.js /OpenMTC-Chula/openmtc/settings/
sudo cp /OpenMTC-Chula/openmtc-NIP/ProxyGateway/config-gscl.js /OpenMTC-Chula/openmtc/settings/
sudo mkdir /OpenMTC-Chula/openmtc-NIP/lib/NIP
sudo cp /OpenMTC-Chula/openmtc-NIP/ProxyGateway/NIP/index.js /OpenMTC-Chula/openmtc-NIP/lib/NIP/
sudo cp /OpenMTC-Chula/openmtc-NIP/ProxyGateway/openmtc/index.js /OpenMTC-Chula/openmtc/lib/
sudo ln -s /OpenMTC-chula/node_modules /OpenMTC-Chula/openmtc-NIP/
sudo ln -s /OpenMTC-Chula/openmtc /OpenMTC-Chula/openmtc-NIP/node_modules/
