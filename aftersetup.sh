#!/bin/bash
# Name: aftersetup.sh for kali linux 2020.1b
# Author: Thmyris
# Last update: 13.07.2020
# About: This file is for when you are done running setup.sh and completely restarted your pc(no session saving)
# Note: see setup.txt for things that need to be done manually.

echo "disabling snap retention..."
# snap - disables storage of previous versions of programs
systemctl restart apparmor
sleep 3
systemctl restart snapd.service
sleep 3
sudo snap set system snapshots.automatic.retention=no
echo "done"

echo "You can see setup.txt now"
