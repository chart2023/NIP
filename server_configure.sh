#!/bin/bash
#sudo touch /opt/openbaton/test.txt
#sudo bash -c 'echo $server_private > /opt/openbaton/test.txt'
#sudo bash -c 'echo $server_private_floatingIp >> /opt/openbaton/test.txt'
sudo echo $server_private >> /home/ubuntu/clientinfo.txt
sudo echo $server_private_floatingIp >> /home/ubuntu/clientinfo.txt
sudo echo exports.iplocal=\'$server_private\'\; >> /OpenMTC-Chula/openmtc/settings/ipnscl.js
