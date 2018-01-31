#!/usr/bin/env python

import time
import os
from threading import Thread

def run_cmd(TheCMD):
    os.system("nice -n 0 "+TheCMD)

while(True):
	time.sleep(1)
	try:
		os.remove("/var/tmp/nohup.out")
	except:
		pass
	try:
		f = open("/var/tmp/command","r");
		command=f.read()
		if(command!=""):
			tcmd = Thread(target=run_cmd, args=(command,))
			tcmd.start()
			fo = open("/var/tmp/command", "w")
			fo.write("")
			fo.close()
			time.sleep(0.008)
	except:
		fo = open("/var/tmp/command", "w")
		fo.write("")
		fo.close()
	
