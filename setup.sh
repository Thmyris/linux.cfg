#!/bin/bash
# Name: setup.sh for kali linux 2020.1b
# Author: Thmyris
# Last update: 16.05.2020
# About: This script requires sudo on several occasions and may require human intervention like pressing enter for tee. Internet connection is required to install package dependencies.
# Note: see setup.txt for things that need to be done manually.

#--------------------------------------------
echo "Internet connection is required"
echo >&2 "Dont forget to check 'automounting win drive' & '#optional deb installs', then comment out this line. You also DON'T want to be root (while running this for a regular user), just in case."; exit 1;
#--------------------------------------------

# Fix -1)get rid of g604 maccel
# https://wiki.archlinux.org/index.php/Mouse_acceleration#Mouse_acceleration_with_libinput
# If your distro uses X11, to completely disable any sort of acceleration/deceleration, create the following file:
# 
# /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
# 
# Section "InputClass"
#  Identifier "<something to identify this snippet>"
#  MatchDriver "libinput"
#  MatchProduct "<substring of the device name>"
#  Option "AccelSpeed" "<e.g. 0.3>"
# EndSection
# 
# Then restart pc(without saving session), or restart X.
# Then you can use xfce's "acceleration"(no its no actually maccel) to #change pointer speed.
# If this somehow doesn't work, its probably because of the automated #setup's permissions.
# code:
sudo tee /etc/X11/xorg.conf.d/50-mouse-acceleration.conf > /dev/null <<EOT
Section "InputClass"
    Identifier "My Mouse"
    MatchIsPointer "yes"
    Option "AccelerationProfile" "-1"
    Option "AccelerationScheme" "none"
    Option "AccelSpeed" "-1"
EndSection
EOT

echo "starting deb installations"
#deb installs, internet connection required for dependencies
sudo apt install -y ./deb/kate_4%3a20.04.0-1_amd64.deb
sudo apt install -y ./deb/ksysguard_4%3a5.17.5-3_amd64.deb
sudo apt install -y ./deb/xinput_1.6.3-1_amd64.deb
sudo apt install -y ./deb/vivaldi-stable_2.11.1811.51-1_amd64.deb
sudo apt install -y ./deb/xclip_0.13-1_amd64.deb
sudo apt install -y ./deb/atom-amd64.deb
sudo apt install -y ./deb/discord-0.0.10.deb
sudo apt install -y ./deb/aptitude_0.8.12-3_amd64.deb
sudo apt install -y ./deb/fdisk_2.34-0.1_amd64.deb
sudo apt install -y ./deb/gobuster_3.0.1-0kali1_amd64.deb
sudo apt install -y ./deb/ffmpeg_7%3a4.2.2-1+b1_amd64.deb
sudo apt install -y ./deb/htop_2.2.0-2_amd64.deb
sudo apt install -y ./deb/qbittorrent_4.1.5-1+deb10u1_amd64.deb
sudo apt install -y ./deb/wget2_1.99.1-2.1_amd64.deb
sudo apt install -y ./deb/vlc_3.0.10-1_amd64.deb
sudo apt install -y ./deb/gdebi_0.9.5.7+nmu3_all.deb
echo "done"

echo "starting optional deb installations"
#optional deb installs
sudo apt install ./deb/snapd_2.42.1-1_amd64.deb
sudo apt install ./deb/libreoffice_1%3a6.4.1-1_amd64_online_installer.deb
echo "done"

# 27) add to $PATH
# 
# The following command adds a path to your current path:
# 
# export PATH="$PATH:/my/custom/path"
# 
# If you want your setup to execute this command every time, there are a number of places where you can put it. When you login, the following scripts will be executed in this order:
# 
# /etc/profile      (which starts by loading everything in /etc/profile.d)
# ~/.profile        (which starts by loading ~/.bashrc if you are running bash)
# 
# Notes
# 
#     ~/.profile is only loaded if ~/.bash_profile and ~/.bash_login DO NOT EXIST. Otherwise, at least bash, will load them instead. It is advisable to use .profile and not the bash specific scripts. So, if in these attempts you created .bash_login, please delete it now.
# 
#     ~/.bashrc is only loaded if you are running an interactive session. (something with a prompt where you can actually type something).
# 
#     ~/.bashrc is loaded again and again, every time you open up a new terminal. So a new tab in gnome-terminal, a new virtual terminal, etc. So even if you don't login again, .bashrc is loaded (and thereby resets its environment) every time you open a new shell.
# 
#     Things like byobu should really go into .profile, (otherwise it won't work ;-)
# 
#     Things like paths should go into .profile if you want them to work outside of the interactive sessions. (say when you press Alt+F2 in GNOME)

#snap path addition
tee -a ~/.profile > /dev/null <<EOT
export PATH="$PATH:/snap/bin"
EOT

#youtube-dl, dependency: ffmpeg(installed above)
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl


# enable bash_aliases
grep -qxF 'if [ -f ~/.bash_aliases ]; then' ~/.bashrc || tee -a ~/.bashrc > /dev/null <<EOT
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
EOT

echo "copying dotfiles"
#dotfiles:
#.tmux.conf
#.bash_aliases
#.config/cherrytree
cp -r dotfiles/. ~/.
echo "done"

echo "copying /files"
cp -r files ~/.
echo "done"

echo "copying fonts"
sudo cp -r font/truetype/. /usr/share/fonts/truetype/
sudo cp -r font/opentype/.  /usr/share/fonts/opentype/
echo "done"

echo "automounting win drive"
# sudo /sbin/blkid
# or
# sudo /sbin/fstab -l
# or
# sudo /sbin/lsblk -f
# ile UUID'leri bulunur. UUID formatta olusturulan partition idsidir.
# 
# Eger disk hic cikarilip takilmayacaksa sda sdb kullanilabilir:
sudo mkdir /media/WIN
sudo bash -c 'echo "#This is for automounting local windows"  >> /etc/fstab'
sudo bash -c 'echo "/dev/sda4 /media/WIN ntfs nls-utf8,umask=000,uid=1000,gid=1000,allow_other,rw 0 0"  >> /etc/fstab'

#NOTE: don't mount into /media/<userid> that folder seems to be write protected for user, yet any new drive you add while linux is on gets mounted there with write privelages. IDK. It can also be that windows marked the entire partition as protected because i powered the pc off while its booting 2-3 times in a row. A quick chkdsk fixed this
echo "done"

echo "installing pip for python3"
#install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py
echo "done"


echo "git cfg"
#15) GIT
git config --global user.email thmyris@windowslive.com
git config --global user.name "Ahmet Faruk Albayrak"
echo "done"


echo "ALL DONE! Don't forget to restart your pc! Have an awesome year!"
echo "You can run aftersetup.sh now"
