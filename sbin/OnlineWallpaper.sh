#!/bin/bash

flag=false

while [ : ]
do
	if [ -s ~/.config/zed/ow ]
	then
		Content="$(cat ~/.config/zed/ow)"
		if [ $Content = "slide" ]
		then
			file=$(wget sispicserver.esy.es/GetRandomWall.php -q -O -)
			if [ "${file:(-3)}" = "jpg" ]
			then
				if [ "$flag" == true ]
				then 
					wget sispicserver.esy.es/wallserver/"$file" -O ~/.config/zed/tmp_wall0.jpg -q
					sleep 10
					gsettings set org.mate.background picture-filename ~/.config/zed/tmp_wall0.jpg
					flag=false
				else
					wget sispicserver.esy.es/wallserver/"$file" -O ~/.config/zed/tmp_wall1.jpg -q
					sleep 10
					gsettings set org.mate.background picture-filename ~/.config/zed/tmp_wall1.jpg
					flag=true
				fi	
				sleep 35
			fi
		else
			wget $Content -O ~/.config/zed/tmp_wall_cam.jpg -q
			sleep 10
			gsettings set org.mate.background picture-filename ~/.config/zed/tmp_wall_cam.jpg
			sleep 35
		fi
	fi
	sleep 5
done
