#!/bin/bash

apt-get update
apt-get install evolution vlc -y

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
	dpkg -i /sbin/configZED/wps64.deb
else
	dpkg -i /sbin/configZED/wpsi386.deb
fi

rm -rf /sbin/configZED
