#!/bin/bash

xfwm4 --compositor=auto
devilspie

cp /usr/share/icons/g3D.png /usr/share/icons/.sdesk.png

pkill -9 -f wake_slap.py
pkill -9 -f smartDesk.py

cd /sbin
mplayer /sbin/START.mp4 -fs &
nice -n 19 ./zed_desk_man.sh &
nice -n 19 ./OnlineWallpaper.sh &
nice -n 19 ./DBStartup.sh &
nice -n 19 ./dropbox_config.gambas &
nice -n 19 python /sbin/wake_slap.py &
nice -n 19 python /sbin/smartDesk.py &
cd /etc/zed_updater/
./updater.sh &

cd /sbin/cp_manager
./ClipBoardManager.sh &

sleep 10

/sbin/configZED/WelcomeScreen.gambas || echo "ZED already configured"

