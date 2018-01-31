#!/usr/bin/python

import tarfile
import sys
import os
import time

if os.geteuid() == 0:
	target_folder = os.getenv("HOME")+"/zif_tmp"
	try:
		os.mkdir(target_folder)
	except:
		pass

	with tarfile.open(sys.argv[1]) as tar:
		tar.extractall(target_folder)


	file = open(target_folder+'/.info', 'r')
	ZIF_FLAG=False
	ZIF_NAME=""
	ZIF_DIR=""
	ZIF_WEBSITE=""
	ZIF_CONTACT=""
	ZIF_ICON=""
	ZIF_DB=""
	ZIF_VERSION=""
	ZIF_CATEGORY=""

	for linha in file.readlines():
		if linha=="[ZIF Information File]\n":
			ZIF_FLAG=True
		if ZIF_FLAG:
			if linha[:2]!="//":
				if "NAME=" in linha:
					ZIF_NAME=linha[5:len(linha)-1]
				if "DIR=" in linha:
					ZIF_DIR="/var/www/html/"+linha[4:len(linha)-1]
					ZIF_FOLDER=linha[4:len(linha)-1]
				if "WEBSITE=" in linha:
					ZIF_WEBSITE=linha[8:len(linha)-1]
				if "CONTACT=" in linha:
					ZIF_CONTACT=linha[8:len(linha)-1]
				if "ICON=" in linha:
					ZIF_ICON=linha[5:len(linha)-1]
				if "DB=" in linha:
					ZIF_DB=linha[3:len(linha)-1]
				if "VERSION=" in linha:
					ZIF_VERSION=linha[8:len(linha)-1]
				if "CATEGORIES=" in linha:
					ZIF_CATEGORY=linha[11:len(linha)-1]

	file.close()
	os.system("mkdir "+ZIF_DIR)
	os.system("cp -a "+target_folder+"/FILES/. "+ZIF_DIR)
	os.system("cp "+target_folder+"/ICON.png "+ZIF_DIR)

	os.system("rm -rf "+target_folder)

	file = open('/usr/share/applications/'+ZIF_FOLDER.lower()+".desktop", 'w')

	file.write("[Desktop Entry]\n\n")
	if ZIF_NAME!="":
		file.write("Name="+ZIF_NAME+"\n")
	if ZIF_ICON!="":
		file.write("Icon="+ZIF_ICON+"\n")
	else:
		file.write("Icon="+ZIF_DIR+"/ICON.png\n")

	if ZIF_VERSION!="":
		file.write("Version="+ZIF_VERSION+"\n")
	if ZIF_CATEGORY!="":
		file.write("Categories="+ZIF_CATEGORY+"\n")

	file.write("Exec=/etc/OpenWA.gambas localhost/"+ZIF_FOLDER+"/"+"\n")

	file.write("Terminal=false\nType=Application")
	file.close();
	os.system("chmod +x "+"/usr/share/applications/"+ZIF_FOLDER.lower()+".desktop")

else:
	os.system("clear")
	print "\n\n\n\n        (!)  Do you need to execute this script as root  (!)\n\n\n\n"

