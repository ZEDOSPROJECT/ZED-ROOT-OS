#!/bin/bash

notify-send -t 3500 "ClipBoard" "ClipBoard changed to Layer 0"
echo -ne "" > /tmp/cp/cp_current
echo -ne $(cat /tmp/cp/cp0) | xclip -sel clip -i
echo -ne "/tmp/cp/cp0" > /tmp/cp/cp_current
