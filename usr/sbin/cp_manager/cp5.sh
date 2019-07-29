#!/bin/bash

notify-send -t 3500 "ClipBoard" "ClipBoard changed to Layer 5"
echo -ne "" > /tmp/cp/cp_current
echo -ne $(cat /tmp/cp/cp5) | xclip -sel clip -i
echo -ne "/tmp/cp/cp5" > /tmp/cp/cp_current

