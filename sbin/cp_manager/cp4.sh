#!/bin/bash

notify-send -t 3500 "ClipBoard" "ClipBoard changed to Layer 4"
echo -ne "" > /tmp/cp/cp_current
echo -ne $(cat /tmp/cp/cp4) | xclip -sel clip -i
echo -ne "/tmp/cp/cp4" > /tmp/cp/cp_current
