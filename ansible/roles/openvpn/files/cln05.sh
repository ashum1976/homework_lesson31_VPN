#!/usr/bin/env bash
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "GATEWAY=192.168.100.2" >> /etc/sysconfig/network-scripts/ifcfg-eth1
systemctl restart network
