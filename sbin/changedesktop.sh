#!/bin/bash


if pgrep "3dUI" > /dev/null
then
	cp /usr/share/icons/g3D.png /usr/share/icons/.sdesk.png
	killall 3dUI
	killall mate-panel
	pkill -f system_command.py
else
	cp /usr/share/icons/g2D.png /usr/share/icons/.sdesk.png
	killall mate-panel
	nice -n 19 python /sbin/system_command.py &
	cd /sbin/
	./3dUI
fi
