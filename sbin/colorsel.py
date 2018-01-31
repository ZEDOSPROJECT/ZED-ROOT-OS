#!/usr/bin/python

import os
from Tkinter import *
from tkColorChooser import askcolor              

color = askcolor() 
RGB=color[0]

PATH=os.getenv("HOME")+"/.config/zed/3d_settings.W"
f = open(PATH,"r+")
num_lines = sum(1 for line in open(PATH))
f.seek(0)
count=0
NewFile=[None] * num_lines
for line in f.readlines():
	if count>=0 and count<=2:
		NewFile[count]=str(RGB[count]/255.0)+"\n"
		count=count+1
	else:
		NewFile[count]=line
		count=count+1
f.seek(0)
for nLine in NewFile:
	f.write(nLine)
f.close()

os.rename(os.getenv("HOME")+"/.config/zed/3d_settings.W",os.getenv("HOME")+"/.config/zed/3d_settings.R")





	


