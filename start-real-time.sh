#!/bin/bash
sleep 30
sudo nohup sudo node /OpenMTC-Chula/openmtc-NIP/ProxyGateway/NIP_IEEE1888_ETSI.js &
sleep 10
sudo nohup sudo node /OpenMTC-Chula/openmtc-NIP/ProxyGateway/NIP_ETSI_IEEE1888_nscl.js &
