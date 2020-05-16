#!/bin/bash
# Name: beforesetup.sh for kali linux 2020.1b
# Author: Thmyris
# Last update: 16.05.2020
# About: This script will only get the archives out for setup.sh. May require internet connection for dependencies.

echo "This script will only get the archives out. This should take a min"

echo "installing needed 7-zip"
sudo apt install -y ./deb/p7zip_16.02+dfsg-7_amd64.deb
echo "done"

echo "unarchiving +100mb .deb files"
cd deb
# atom start
7zr x atom-amd64.zip.001 -tsplit # use l to check the archive
unzip -q atom-amd64.zip
rm atom-amd64.zip.001
rm atom-amd64.zip.002
rm atom-amd64.zip
# atom finish
cd ..
echo "done"

echo "unarchiving /files"
7zr e files.zip.001 -tsplit
unzip -q files.zip
rm files.zip
rm files.zip.*
echo "done"

echo "You can run setup.sh now."

