#!/bin/ash

while read line; do
	a=$line
#	echo $a
    ./tparser.lua $a
done