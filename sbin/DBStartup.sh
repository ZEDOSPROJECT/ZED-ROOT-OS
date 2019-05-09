#!/bin/bash

while [ : ]; do
	if [ -s ~/MEGASync/Startup.txt ]
	then
		while IFS='' read -r line || [[ -n "$line" ]]; do
			eval "$line" &
		done < ~/MEGASync/Startup.txt
		rm ~/MEGASync/Startup.txt
	fi
	sleep 5
done
