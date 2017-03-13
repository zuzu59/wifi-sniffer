#!/bin/ash

#cat tframe.txt |./tread_stream.sh

tcpdump -i wlan0 -n |grep -i -v 'RA:f4:4e:05:e7:a5\|RA:f8:c2:88:80:3d\|RA:b4:14:89:d0:ae\|RA:68:86:a7:d6:ff\|:cd:e4z' |grep -i 'RA:' |./tread_stream.sh
