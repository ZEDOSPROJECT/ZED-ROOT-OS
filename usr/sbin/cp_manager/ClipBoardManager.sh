#!/bin/bash

#NEED XCLIP
#Set word TEXTE_CP to clipboard
#echo -ne "Texte de CP" | xclip -sel clip -i

#Get Clipboard
#xclip -sel clip -o

# True Script

mkdir /tmp/cp

echo -ne "/tmp/cp/cp0" > /tmp/cp/cp_current
echo "" > /tmp/cp/cp0
echo "" > /tmp/cp/cp1
echo "" > /tmp/cp/cp2
echo "" > /tmp/cp/cp3
echo "" > /tmp/cp/cp4
echo "" > /tmp/cp/cp5
echo "" > /tmp/cp/cp6
echo "" > /tmp/cp/cp7
echo "" > /tmp/cp/cp8
echo "" > /tmp/cp/cp9

while [ true ]
do
	echo -ne $(xclip -sel clip -o) > $(cat /tmp/cp/cp_current)
	sleep 003
done

