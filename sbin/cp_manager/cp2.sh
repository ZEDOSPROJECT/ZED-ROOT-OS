#!/bin/bash

notify-send -t 3500 "ClipBoard" "ClipBoard changed to Layer 2"
echo -ne "" > /tmp/cp/cp_current
echo -ne $(cat /tmp/cp/cp2) | xclip -sel clip -i
echo -ne "/tmp/cp/cp2" > /tmp/cp/cp_current

