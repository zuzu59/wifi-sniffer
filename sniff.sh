#!/bin/ash

clear
echo http://www.macvendorlookup.com/
echo

tcpdump -i wlan0 -n |grep -i -v 'Beacon\|Prob\|QoS\|RA:f4:4e:05:e7:a5\|RA:f8:c2:88:80:3d\|:cd:e4' |grep -i 'Request-To-Send\|Clear-To-Send\|Acknowledgment'

