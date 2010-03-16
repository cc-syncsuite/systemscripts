#!/bin/bash

if [ "$#" -ne 1 ] ; then
	echo "$0 <basename>"
	exit 1
fi

rsync -vvxra --delete --specials --devices --progress -I / rsync://root@192.168.1.23:/uploadrf/basesystems/$1
