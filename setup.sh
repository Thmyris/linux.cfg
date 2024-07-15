#!/bin/bash
# Name: setup.sh for kali linux 2020.3(last version with bash)
# Author: Thmyris
# Last update: 14.07.2024
# About: This script requires sudo on several occasions and does require human intervention. Internet connection is required to install packages & dependencies.
# Note: see setup.txt for things that need to be done manually.

#--------------------------------------------

echo -e "Pre-flight checklist:\n 1) Make sure you are connected to the internet\n 2) Make sure you ran beforesetup.sh already. \n 3) Check #automounting windows\n 4) Check #optional deb installs\n 5) You also DON'T want to be the user 'root' (if you are running this for a regular user acc).\n 6) Check #dotfiles\n 7) Check #git\n 8) Otherwise have a nice flight!";
echo "The stuff that needs user attention has been placed at the top of the script. After continuing, you'll just have to type your sudo password once, install a few stuff in gui and then it's all autopilot"
echo "If you want to troubleshoot later you should run this script as './setup.sh | tee setup.log' But you should be just fine without it."
while true; do
    read -p "Do you wish to continue?(y/n): " yesno
    case $yesno in
        [Yy]* ) break;;
        [Nn]* ) echo "Goodbye!"; exit 1;;
        * ) echo "Please answer yes or no.";;
    esac
done

#--------------------------------------------

# Colors! (bash variables to control the output appearance)
bold=$(tput bold)
red_bg=$(tput setab 1)
normal=$(tput sgr0) # Put this to reset back to normal output, if you don't last change will apply down the script forever.
# Copy this fella:
# echo "${bold}${red_bg}TEST${normal}"

#--------------------------------------------

# fix repos
echo "${bold}${red_bg}'fixing' repos =)${normal}"
echo "${bold}${red_bg}Enter sudo pw for sudo cp:${normal}"
if [ ! -f /etc/apt/linuxcfg.sources.list.bak ]; then
    sudo cp /etc/apt/sources.list /etc/apt/linuxcfg.sources.list.bak
fi
sudo tee /etc/apt/sources.list > /dev/null <<EOT
# See https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/
# <Archive>   <Mirror>                <Branch>         <Component>
deb http://http.kali.org/kali kali-rolling main non-free contrib
deb-src http://http.kali.org/kali kali-rolling main contrib non-free
deb http://ftp.de.debian.org/debian buster main

# This file is added by linux.cfg/setup.sh to make sure default repos are set up correctly and add debian repos because why not
# Original file is backed up as "linuxcfg.sources.list.bak" in case you want to restore it.
EOT
sleep 0.05
sudo apt update
sleep 0.1
echo "${bold}${red_bg}done${normal}"

echo "${bold}${red_bg}Installing miniconda, needs user attention!${normal}"
./deb/Miniconda3-latest-Linux-x86_64.sh
conda config --set auto_activate_base false
echo "${bold}${red_bg}done${normal}"

echo "${bold}${red_bg}Installing Jdownloader2, needs user attention!${normal}"
./deb/JD2Setup_x64.sh
echo "${bold}${red_bg}done${normal}"

#deb installs, internet connection required
#NOTE on the local .deb files: These are here for backup purposes. In case kali or debian repos don't have the package dependencies they most likely won't install. If you really wanna install .deb files locally, use:
#sudo gdebi FILE.deb
#or if you are feeling adventurous:
#yes | sudo gdebi FILE.deb
#The deb files that HAS to be installed first starts with a. The deb files that need user interaction starts with a2, so we can get rid of them early on. The deb files that should be installed early starts with a3.

echo "${bold}${red_bg}Installing these .deb files:${normal}"
for f in deb/*.deb ; do echo $f; done

for f in deb/*.deb
do
if [ $f = "deb/aptitude_0.8.12-3_amd64.deb" ]
then
sleep 0.3
echo "."
sleep 0.3
echo "."
sleep 0.3
echo "."
sleep 0.2
echo "${bold}${red_bg}No more user attention should be needed anymore. Kick back and enjoy.${normal}" 
sleep 1
echo "${bold}${red_bg}Speeding up!${normal}"
sleep 3
fi
sudo apt install -y ./$f
done

#This used to be the oneliner:
#for f in deb/*.deb ; do sudo apt install -y ./$f; done

sudo dpkg -i deb/bat_0.17.1_amd64.deb
echo "${bold}${red_bg}done${normal}"
# Oh no people know the versions of the programs I use, how insecure!

#optional deb installs (comment out unwanted packages)
echo "${bold}${red_bg}Starting non-local deb installations${normal}" # Can't install from local deb file
sudo apt install -y qbittorrent
sudo apt install -y vlc
sudo apt install -y ffmpeg
sudo apt install -y krita
sudo apt install -y ksysguard
sudo apt install -y aptitude
sudo apt install -y sox             #play command
sudo apt install libsox-fmt-all     #play command
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

#--------------------------------#
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
#--------------------------------#
#PATH ADDITION IS NOW HANDLED BY .BASHRC FROM DOTFILES
#--------------------------------#

#youtube-dl, dependency: ffmpeg(installed above)
echo "${bold}${red_bg}setting up youtube-dl${normal}"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "${bold}${red_bg}done${normal}"

# init bash_aliases if it isnt in .bashrc already(VERY OUTDATED)
#echo "${bold}${red_bg}add bash_aliases in .bashrc${normal}"
#grep -qxF 'if [ -f ~/.bash_aliases ]; then' ~/.bashrc || tee -a ~/.bashrc > /dev/null <<EOT
#if [ -f ~/.bash_aliases ]; then
#. ~/.bash_aliases
#fi
#EOT
#echo "${bold}${red_bg}done${normal}"


#dotfiles 
#WARNING: for xfce4!!
#WARNING: username HAS TO BE 'thmyris'. Comment this out if you are a different user. If you just want to test my configs you can manually copy dotfiles into a new user acc named thmyris after ur done
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


#automounting windows:
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
sudo bash -c 'echo "UUID="6E8A4B598A4B1CC9" /media/WIN ntfs nls-utf8,umask=000,uid=1000,gid=1000,allow_other,rw 0 0"  >> /etc/fstab'
#NOTE: don't mount into /media/<userid> that folder seems to be write protected for user, yet any new drive you add while linux is on gets mounted there with write privelages. IDK. It can also be that windows marked the entire partition as protected because i powered the pc off while its booting 2-3 times in a row. A quick chkdsk fixed this.
# The mount point can change but UUID never changes. So if you have multiple disks it's more reliable to use UUID's. Or use /dev/sda1
# UUID=28B45E63B45E3392 /media/WIN ntfs nls-utf8,umask=000,uid=1000,gid=1000,allow_other,rw 0 0
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


echo "${bold}${red_bg}SETUP COMPELTE! Don't forget to restart your pc! Have an awesome year!${normal}"
echo "${bold}${red_bg}You can run aftersetup.sh after the restart.${normal}"


while true; do
    read -p "Do you wish reboot right now?(y/n): " yesno
    case $yesno in
        [Yy]* ) xfce4-session-logout --reboot; break;;
        [Nn]* ) echo "Goodbye!"; exit 1;;
        * ) echo "Please answer with a y or n.";;
    esac
done
