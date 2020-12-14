#!/bin/bash
# Name: aftersetup.sh for kali linux 2020.3
# Author: Thmyris
# Last update: 14.12.2020
# About: This file is for when you are done running setup.sh and completely restarted your pc(no session saving)


#echo "disabling miniconda auto-activation"
#conda config --set auto_activate_base false
#echo "done"
#^handled in setup.sh

echo "disabling snap retention..."
# snap - disables storage of previous versions of programs
sudo systemctl restart apparmor
sleep 3
sudo systemctl restart snapd.service
sleep 3
sudo snap set system snapshots.automatic.retention=no
echo "done"

echo "installing foobar2000"
sudo snap install foobar2000
echo "done"

echo "installing scrcpy"
sudo snap install scrcpy
echo "done"

#atom sync-settings
echo "installing atom sync-settings plugin"
apm install sync-settings
echo "done"

echo "You are almost done! You can see setup.txt now"
