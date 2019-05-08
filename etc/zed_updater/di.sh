#!/bin/bash

progress(){
	while [ nFinish ]; do
		sleep 1
		wc -c < /tmp/update.tar.gz > /tmp/lfs
	done
}

download()
{
    local url=$1
    echo -n "    "
    wget --progress=dot $url 2>&1 | grep --line-buffered "%" | \
        sed -u -e "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
    echo -ne "\b\b\b\b"
    echo " DONE"
}


cd /tmp
file="/update.tar.gz"
echo -n "Downloading $file:"
curl -sI https://zed-os.sourceforge.io/UPDATES/zed/2018/$file | grep Content-Length | awk '{print $2}' > /tmp/dfs
nFinish=True
progress &
download "http://zedos.000webhostapp.com/updates/2018/$file"
tar -zxvf /tmp/update.tar.gz -C /
cp /etc/xdg/opoenbox/rc.xml /home/$USER/.config/openbox/rc.xml
sudo update-initramfs -u
./postInstall.sh
rm postInstall.sh
cd /
rm /tmp/update.tar.gz
rm /tmp/dfs
rm /tmp/lfs

