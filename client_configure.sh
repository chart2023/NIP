#!/bin/bash
#sudo touch /opt/openbaton/clientinfo.txt
#sudo bash -c 'echo $client_private > /opt/openbaton/clientinfo.txt'
#sudo bash -c 'echo $client_private_floatingIp >> /opt/openbaton/clientinfo.txt'
sudo echo $server_private >> /home/ubuntu/serverinfo.txt
sudo echo $server_private_floatingIp >> /home/ubuntu/serverinfo.txt
#sudo echo $server_hostname >> /home/ubuntu/serverinfo.txt
