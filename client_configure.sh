#!/bin/bash
sudo touch /opt/openbaton/clientinfo.txt
sudo bash -c 'echo $client_private > /opt/openbaton/clientinfo.txt'
sudo bash -c 'echo $client_private_floatingIp >> /opt/openbaton/clientinfo.txt'
