#!/bin/bash

notify-send -t 3500 "ClipBoard" "ClipBoard changed to Layer 6"
echo -ne "" > /tmp/cp/cp_current
echo -ne $(cat /tmp/cp/cp6) | xclip -sel clip -i
echo -ne "/tmp/cp/cp6" > /tmp/cp/cp_current

