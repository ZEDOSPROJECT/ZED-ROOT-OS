#!/bin/bash


apt-get update
apt-get install twoftpd samba ssh ffproxy postfix -y
rm -rf /sbin/configZED
