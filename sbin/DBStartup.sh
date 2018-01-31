#!/bin/bash

while [ : ]; do
	if [ -s ~/Dropbox/Startup.txt ]
	then
		while IFS='' read -r line || [[ -n "$line" ]]; do
			eval $line &
		done < ~/Dropbox/Startup.txt
		rm ~/Dropbox/Startup.txt
	fi
	sleep 5
done
