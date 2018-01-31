#!/bin/bash




MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
	if pgrep "3dUI.x86_64" > /dev/null
	then
		cp /usr/share/icons/g3D.png /usr/share/icons/.sdesk.png
		killall 3dUI.x86_64
		killall mate-panel
		pkill -f system_command.py
	else
		cp /usr/share/icons/g2D.png /usr/share/icons/.sdesk.png
		killall mate-panel
		nice -n 19 python /sbin/system_command.py &
		cd /sbin/
		./3dUI.x86_64 -force-opengl
	fi
else
	if pgrep "3dUI.x86" > /dev/null
	then
		cp /usr/share/icons/g3D.png /usr/share/icons/.sdesk.png
		killall 3dUI.x86
		killall mate-panel
		pkill -f system_command.py
	else
		cp /usr/share/icons/g2D.png /usr/share/icons/.sdesk.png
		killall mate-panel
		nice -n 19 python /sbin/system_command.py &
		cd /sbin/
		./3dUI.x86 -force-opengl
	fi
fi
