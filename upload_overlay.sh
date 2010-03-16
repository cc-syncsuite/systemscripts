#!/bin/bash

TMPDIR=/tmp/overlay

if [ -z "${IF}" ] ; then
	IF=eth0
fi

MAC=$(cat /sys/class/net/eth0/address | sed 's/://g')
mkdir -p "${TMPDIR}"
for file in $@; do
	mkdir -p "${TMPDIR}$(basename $file)"
	cp -vr "$file" "${TMPDIR}"
done

rsync -vvxra --delete --specials --devices --progress -I ${TMPDIR} rsync://root@192.168.1.23:/uploadrf/overlays/${MAC}
