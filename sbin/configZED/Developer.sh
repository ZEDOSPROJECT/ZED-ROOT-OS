#!/bin/bash


apt-get update
apt-get install geany lamp-server^ python eclipse java-common java-jdk*  -y

dpkg -i /sbin/configZED/xampp.run

rm -rf /sbin/configZED
