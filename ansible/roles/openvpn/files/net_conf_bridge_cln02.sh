#!/usr/bin/env bash

# ip a d 192.168.224.4/28 dev eth4
ip l a name br0 type bridge
ip l s dev tap0 master br0
ip l s dev eth2 master br0
ip  a a 192.168.224.3/28 dev br0
ip l s dev br0 up
ip l s dev tap0 up
# 08:00:27:95:bf:0e - (srv01 - eth4 )
# 08:00:27:ca:86:09 - (cln02 - eth2)
# ebtables -t nat -A POSTROUTING -o eth4 -j snat --to-source 08:00:27:95:bf:0e --snat-arp
# ebtables -t nat -A PREROUTING -p ARP -i eth4 --arp-ip-dst 192.168.224.3 -j dnat --to-dst 08:00:27:ca:86:09
