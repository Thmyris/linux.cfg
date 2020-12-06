#!/bin/bash
# Name: aftersetup.sh for kali linux 2020.3
# Author: Thmyris
# Last update: 17.11.2020
# About: This file is for when you are done running setup.sh and completely restarted your pc(no session saving)

echo "disabling snap retention..."
# snap - disables storage of previous versions of programs
systemctl restart apparmor
sleep 3
systemctl restart snapd.service
sleep 3
sudo snap set system snapshots.automatic.retention=no
echo "done"

echo "installing foobar2000"
snap install foobar2000
echo "done"

echo "installing scrcpy"
snap install scrcpy
echo "done"

echo "You can see setup.txt now"
