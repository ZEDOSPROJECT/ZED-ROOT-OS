#!/bin/bash

notify-send -t 3500 "ClipBoard" "ClipBoard changed to Layer 3"
echo -ne "" > /tmp/cp/cp_current
echo -ne $(cat /tmp/cp/cp3) | xclip -sel clip -i
echo -ne "/tmp/cp/cp3" > /tmp/cp/cp_current

