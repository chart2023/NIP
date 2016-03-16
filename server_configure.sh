#!/bin/bash
#sudo touch /opt/openbaton/test.txt
#sudo bash -c 'echo $server_private > /opt/openbaton/test.txt'
#sudo bash -c 'echo $server_private_floatingIp >> /opt/openbaton/test.txt'
sudo echo $server_private >> /home/ubuntu/clientinfo.txt
sudo echo $server_private_floatingIp >> /home/ubuntu/clientinfo.txt
sudo echo exports.ipnscl=\'$server_private\'\; >> /OpenMTC-Chula/openmtc/settings/ipserv.js
sudo bash -c "echo exports.ipnip=\'`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`\'\; >> /OpenMTC-Chula/openmtc/settings/ipserv.js"
sudo echo exports.fipnip=\'$server_private_floatingIp\'\; >> /OpenMTC-Chula/openmtc/settings/ipserv.js
sudo echo exports.ipopenstack=\'161.200.90.78\'\; >> /OpenMTC-Chula/openmtc/settings/ipserv.js
