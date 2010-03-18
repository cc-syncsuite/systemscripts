#!/bin/bash

if [ "$#" -ne 4 ] ; then
	echo 'Usage: $0 <mac> <ip> <hostname> {p5b|p5v}'
	exit 1
fi

cp -r overlays/template_$4 overlays/$1
echo $3 > overlays/$1/etc/hostname
cat overlays/$1/etc/network/interfaces_ | sed -r "s/%IP%/$2/" > overlays/$1/etc/network/interfaces
cp -r configs/0018f3681dcb configs/$1
echo $2 > configs/$1/network
echo $3 >> configs/$1/network
