#!/bin/bash

notify-send -t 3500 "ClipBoard" "ClipBoard changed to Layer 7"
echo -ne "" > /tmp/cp/cp_current
echo -ne $(cat /tmp/cp/cp7) | xclip -sel clip -i
echo -ne "/tmp/cp/cp7" > /tmp/cp/cp_current

