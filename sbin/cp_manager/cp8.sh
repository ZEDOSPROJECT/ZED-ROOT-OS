#!/bin/bash

notify-send -t 3500 "ClipBoard" "ClipBoard changed to Layer 8"
echo -ne "" > /tmp/cp/cp_current
echo -ne $(cat /tmp/cp/cp8) | xclip -sel clip -i
echo -ne "/tmp/cp/cp8" > /tmp/cp/cp_current

