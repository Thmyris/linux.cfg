#!/bin/bash
# Name: setup.sh for kali linux 2020.1b
# Author: Thmyris
# Last update: 13.07.2020
# About: This script requires sudo on several occasions and may require human intervention like pressing enter for tee. Internet connection is required to install package dependencies.
# Note: see setup.txt for things that need to be done manually.

#--------------------------------------------
echo "Internet connection is required"
echo >&2 "Have you ran beforesetup.sh already? Dont forget to check 'automounting win drive' & '#optional deb installs', then comment out this line. You also DON'T want to be the user 'root' (while running this for a regular user)."; exit 1;
#--------------------------------------------

# Colors! (bash variables to control the output appearance)
bold=$(tput bold)
red_bg=$(tput setab 1)
normal=$(tput sgr0) # Put this to reset back to normal output, if you don't last change will apply down the script forever.
# Copy this fella:
# echo "${bold}${red_bg}TEST${normal}"

#deb installs, internet connection required for dependencies
echo "${bold}${red_bg}starting deb installations${normal}"
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
sudo apt install -y ./deb/tree_1.8.0-1+b1_amd64.deb
sudo apt install -y ./deb/steghide_0.5.1-14_amd64.deb
sudo apt install -y ./deb/cherrytree_0.39.4-0_all.deb
sudo apt install -y ./deb/krita_1%3a4.2.9+dfsg-1+b1_amd64.deb
sudo apt install -y ./deb/veracrypt-1.24-Update4-Debian-10-amd64.deb
echo "${bold}${red_bg}done${normal}"
# Oh no ppl know the versions of the programs I use, how insecure!

#optional deb installs (comment out unwanted packages)
echo "${bold}${red_bg}starting optional deb installations${normal}"
sudo apt install -y ./deb/snapd_2.42.1-1_amd64.deb
sudo apt install -y ./deb/libreoffice_1%3a6.4.1-1_amd64_online_installer.deb
echo "${bold}${red_bg}done${normal}"


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
echo "${bold}${red_bg}applying maccel fix for g604${normal}"
sudo tee /etc/X11/xorg.conf.d/50-mouse-acceleration.conf > /dev/null <<EOT
Section "InputClass"
    Identifier "My Mouse"
    MatchIsPointer "yes"
    Option "AccelerationProfile" "-1"
    Option "AccelerationScheme" "none"
    Option "AccelSpeed" "-1"
EndSection
EOT
echo "${bold}${red_bg}done${normal}"

# add to $PATH note:
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
echo "${bold}${red_bg}adding snap to path${normal}"
tee -a ~/.profile > /dev/null <<EOT
export PATH="$PATH:/snap/bin"
EOT
echo "${bold}${red_bg}done${normal}"

#youtube-dl, dependency: ffmpeg(installed above)
echo "${bold}${red_bg}setting up youtube-dl${normal}"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "${bold}${red_bg}done${normal}"

# enable bash_aliases
echo "${bold}${red_bg}add bash_aliases in .bashrc${normal}"
grep -qxF 'if [ -f ~/.bash_aliases ]; then' ~/.bashrc || tee -a ~/.bashrc > /dev/null <<EOT
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
EOT
echo "${bold}${red_bg}done${normal}"

#dotfiles
echo "${bold}${red_bg}copying dotfiles${normal}"
cp -r dotfiles/. ~/.
echo "${bold}${red_bg}done${normal}"

#files
echo "${bold}${red_bg}copying /files${normal}"
cp -r files ~/.
echo "${bold}${red_bg}done${normal}"

#fonts
echo "${bold}${red_bg}copying fonts${normal}"
sudo cp -r font/truetype/. /usr/share/fonts/truetype/
sudo cp -r font/opentype/.  /usr/share/fonts/opentype/
echo "${bold}${red_bg}done${normal}"

# automounting windows:
# sudo /sbin/blkid
# or
# sudo /sbin/fstab -l
# or
# sudo /sbin/lsblk -f
# ile UUID'leri bulunur. UUID formatta olusturulan partition idsidir.
# 
# Eger disk hic cikarilip takilmayacaksa sda sdb kullanilabilir:
echo "${bold}${red_bg}automounting win drive${normal}"
sudo mkdir /media/WIN
sudo bash -c 'echo "#This is for automounting local dual boot windows"  >> /etc/fstab'
sudo bash -c 'echo "/dev/sda4 /media/WIN ntfs nls-utf8,umask=000,uid=1000,gid=1000,allow_other,rw 0 0"  >> /etc/fstab'
#NOTE: don't mount into /media/<userid> that folder seems to be write protected for user, yet any new drive you add while linux is on gets mounted there with write privelages. IDK. It can also be that windows marked the entire partition as protected because i powered the pc off while its booting 2-3 times in a row. A quick chkdsk fixed this.
echo "${bold}${red_bg}done${normal}"

#install pip
echo "${bold}${red_bg}installing pip for python3${normal}"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py
echo "${bold}${red_bg}done${normal}"


# GIT
echo "${bold}${red_bg}git cfg${normal}"
git config --global user.email thmyris@windowslive.com
git config --global user.name "Ahmet Faruk Albayrak"
# TODO: This is missing the ssh key part but im not uploading my key to github anyway lmao, maybe in the future, encrypted

echo "${bold}${red_bg}done${normal}"

echo "${bold}${red_bg}ALL DONE! Don't forget to restart your pc! Have an awesome year!${normal}"
echo "${bold}${red_bg}You can run aftersetup.sh now...${normal}"
