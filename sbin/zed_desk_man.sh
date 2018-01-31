#!/bin/bash

#loop que testa se dropbox esta aberto
while [ : ]
do
	DB_STATUS="$(dropbox status)"
	if [ "$DB_STATUS" = "Up to date" ]
		if [ -s ~/.config/zed/bg ] ; then
			#get current wallpaper from MATE DE
			ACT_PATH=$(gsettings get org.mate.background picture-filename)
			ACT_PATH=$(echo $ACT_PATH  | cut -d "'" -f 2)

			#Get Local file and Dropbox file BG content
			LOCAL_FILE=$(cat ~/.config/zed/bg)

			#if LAST_PATH and ACT_PATH is different, means the MATE DE backgraund is changed				if [ "$LAST_PATH" != "$ACT_PATH" ]
			if [ "$LAST_PATH" != "$ACT_PATH" ]
			then
				#write new wallpaper file path selected to BG file
				LAST_PATH=$ACT_PATH
				echo -n $LAST_PATH > ~/.config/zed/bg
				sleep 0.5

				#set the wallpaper to MATE DE from BG file
				gsettings set org.mate.background picture-filename "$LAST_PATH"					
			fi

			if [ "$LOCAL_FILE" != "$LAST_LOCAL_FILE" ]
			then
				LAST_LOCAL_FILE=$LOCAL_FILE	
				LAST_PATH=$LOCAL_FILE	
				gsettings set org.mate.background picture-filename "$LOCAL_FILE"			
			fi
			sleep 1
		else
			if ! pgrep "dropbox" > /dev/null
			then
				touch ~/.config/zed/bg -a -m -d '1 Jan 1999 12:34'
			fi
		fi
	fi
done
