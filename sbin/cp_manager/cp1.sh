#!/bin/bash

notify-send -t 3500 "ClipBoard" "ClipBoard changed to Layer 1"
echo -ne "" > /tmp/cp/cp_current
echo -ne $(cat /tmp/cp/cp1) | xclip -sel clip -i
echo -ne "/tmp/cp/cp1" > /tmp/cp/cp_current
