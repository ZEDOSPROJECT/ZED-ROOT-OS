#!/bin/bash

while [ True ]; do
	versionServer=$(wget -q -O- http://sispicserver.esy.es/UPDATES/zed/2018/zed.version)
	versionLocal=$(sed -n '1p' < /etc/zed_updater/version)
	if [ "$versionServer" != "" ]; then
		if [ "$versionLocal" -lt "$versionServer" ];then
			./ui.gambas
		fi
	fi
	sleep 200
done
