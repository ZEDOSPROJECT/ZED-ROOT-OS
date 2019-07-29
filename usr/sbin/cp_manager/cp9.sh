#!/bin/bash

notify-send -t 3500 "ClipBoard" "ClipBoard changed to Layer 9"
echo -ne "" > /tmp/cp/cp_current
echo -ne $(cat /tmp/cp/cp9) | xclip -sel clip -i
echo -ne "/tmp/cp/cp9" > /tmp/cp/cp_current

