#!/bin/bash

TMPDIR=/tmp/overlay

absolutify() {
	readlink -f $1
}

if [ -z "${IF}" ] ; then
	IF=eth0
fi

MAC=$(cat /sys/class/net/eth0/address | sed 's/://g')
mkdir -p "${TMPDIR}"
for file in "$@" ; do
	NPATH=$(dirname $(absolutify $file))
	mkdir -p "${TMPDIR}${NPATH}"
	cp -vr "$file" "${TMPDIR}${NPATH}"
done

rsync -vvxra --specials --devices --progress -c ${TMPDIR}/ rsync://root@192.168.1.23:/uploadrf/overlays/${MAC}
rm -rf ${TMPDIR}
