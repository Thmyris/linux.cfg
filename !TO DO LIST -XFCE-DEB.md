
is there any way to stop cherrytree from "modernizing" punctuations like " and '. It's messing up code.
find a proper video player, or, wine mpc-hc
install flux or alternative

set up mpv with the smplayer multimedia engine
startup programs (how does startup mgmt work in liunux?)
fix brightness shortcuts etc (autohotkey again?)
fix middle click again
maybe setup ssh for git
disable touchpad acceleration (tested it, its horrendeus)
fix g604 acceleration, again. Its not proper. theres still weird mouse smoothing or some shit
bring back keyboard shortcuts for shit chromebook keyboard. Notably HOME END PGUP PGDOWN DELETE, BRIGHTNESS
VOLUME CONTROL on mouse gesture.


playonlinux un varligini note al

Things that were alredady done in kali:
install tmux



1) mouse sens
settings editor -> pointers -> Logitech_G604_:
acceleration Double 3.0 (this doesnt mean maccel -_-)
RightHanded Boolean TICK
Threshold Integer 1920

2) cube package man (i didnt use this one)
download cube .zip file
extract
double click cube
create project
open project
download repositories
update computers repositories (otherwise installation may fail) (isnt this basically sudo apt-get update, lmao)
installation log: cube/cube-system/data/temp/install-log.txt
Cleaning Project
Now that the packages are installed, we can now remove these packages from the project to save space.
Click Cube -> Project -> Clean Project.
HEYYYYYYYYY YOU LEFT OFF HEREEEEEEEEEEEEEEEEEEEEEEEEEE -> search inside cubes repository to cross check if the offline apt package installation website says the same thing cube does under the hood

3) package man (offline apt repo) (this fuking sucks use the method i explained in #linux ffs)
apt-cache search <repo summary name>

- cd /var/local-deb-repo
    sudo bash -c 'dpkg-scanpackages . | gzip > ./Packages.gz' burda release.gz yi de yaptim, 2si varken oldu hangisi lazim anlamadim.

- aptin sources.list dosyasina ekledigimiz ifadeyi
deb [trusted=yes] file:/var/local-deb-repo/ ./
seklinde degistirmek zorundayiz yoksa apt bu repoyu kullanmiyor.d

- burda bi sorun var oda su, dosya kalinin reposunda da varsa nerden indirip kuracagini --bilmiyoruz-- biliyoruz ustten asa dogru kontrol ediyor repolari (strong prediction)

4) unticked restore numlock from settings editor -> keyboards in hopes of fixing numlock bug on login (tested with win+l, doesnt seem to have worked)

5) fix fullscreen windows seeping under the start menu
xfce4-panel -> panel preferences -> dont reserve space on borders

6) show desktop shortcut
window manager -> keyboard -> show desktop

7) alt+F4 -> F4
window manager -> keyboard -> close window

8) terminal shortcut
keyboard -> exo-open --launch TerminalEmulator

9) window manager tweaks
window manager tweaks -> cycle through windows in a list
	`		 notify urgency by making window's decoration blink
			 use the mouse wheel on desktop to switch workplaces
			 show shadows under popup windows
10) settings -> appearance -> custom dpi setting: 107
	     -> desktop -> single click to activate items
	     -> file manager preferences -> Date: Custom: %d/%m/%Y %H:%M:%S
	                                 -> (EXPERIMENTING)Open new thunar instances as tabs 

11) file manager -> view -> view as detailed list
you can still right click in the current directory on file type
you can select multiple files the same way (hold m1)

12) app finder
alt+f3 -> win+r (adv)
alt+f2
NOTE: This is different from start menu finder

13) volume control
microphone @ %50 is good.

14) xfce4-screenshooter
shift+printscreen
xfce4-shreenshooter --region -> Ctrl + ]
xfce4-screenshooter --window -> Ctrl + [

15) GIT
git config --global user.email thmyris@windowslive.com
git config --global user.name "Ahmet Albayrak"

16) touchpad reverse scroll
touchpad setings -> TICK reverse scroll direction

17) middle click fix
This solution will work globally and preserve the middle mouse functionality.
Install xbindkeys xsel xdotool
Place this in ~/.xbindkeysrc
"echo -n | xsel -n -i; pkill xbindkeys; xdotool click 2; xbindkeys"
b:2 + Release
Reload xbindkeys -p
Run xbindkeys on startup(it auto added itself on kali20201b, NOP doesnt work on restart!! fix), pkill xbindkeys to stop.

18)SEC - install gobuster
deb in archive

19) youtube-dl
if you wanna get the latest deb file:
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
privelages: sudo chmod a+rx /usr/local/bin/youtube-dl
dont forget to install ffmpeg

20) timeshift for system files backup
idk, is this really needed?
i installed the program it has gui and stuff but i havent used it
it says it requires ext4 file format for the backup file which is kinda impractical
but
i just figured out by accident
that my 2tb drive has 35gb linux in it
its very likely its kali
idk when or why i installed it there it must be ancient

21) aliases
i like using a seperate file to keep track of aliases only
so:
```The second method lets you make a separate aliases file, so you won't have to put them in .bashrc, but to a file of your choice. First, edit your ~/.bashrc file and add the following lines if they don't already exist, or uncomment them if they do:
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

Save it and close the file. After that, all you have to do is create a ~/.bash_aliases file and add your aliases there, with the same format specified in the first method.
Contents of my ~/.bash_aliases file:
alias cs='cd;ls'
```

22) xclip alias
alias xclip = 'xclip -selection clipboard'

23) automount win drive
sudo /sbin/blkid
or
sudo /sbin/fstab -l
or
sudo /sbin/lsblk -f
ile UUID'leri bulunur. UUID formatta olusturulan partition idsidir.

Eger disk hic cikarilip takilmayacaksa sda sdb kullanilabilir:
sudo mkdir /media/WIN
sudo bash -c 'echo "/dev/sda4 /media/WIN ntfs nls-utf8,umask=000,uid=1000,gid=1000,allow_other,rw 0 0"  >> /etc/fstab'

NOTE: don't mount into /media/<userid> that folder seems to be write protected for user, yet any new drive you add while linux is on gets mounted there with write privelages. IDK. It can also be that windows marked the entire partition as protected because i powered the pc off while its booting 2-3 times in a row. A quick chkdsk fixed this

24) bash: fdisk: command not found
paket yuklu ama komut bulunamazsa PATH e eklenmemistir. 
dosyasi '/sbin/fstab' yazilarak calistirilabilir
pro tip: root user olursaniz (sudo -i) calisiyorlar -_-

25) disable snap auto update
That said, there are a few workarounds to fool the snap tool from auto updating. Simply run the following commands on ALL your LXD servers:

snap set system proxy.http="http://127.0.0.1:1111"
snap set system proxy.https="http://127.0.0.1:1111"

–or–

You can run these IPTables commands:
sudo /sbin/iptables -F #WARNING: -F cleans iptables
sudo /sbin/iptables -A OUTPUT -d api.snapcraft.io -j DROP
#make persistent for reboots
sudo /sbin/iptables-save > /etc/iptables.up.rules #save the rules
sudo bash -c 'echo "#!/bin/sh"  >> /etc/network/if-pre-up.d/iptables'
sudo bash -c 'echo "/sbin/iptables-restore < /etc/iptables.up.rules"  >> /etc/network/if-pre-up.d/iptables'
sudo chmod +x /etc/network/if-pre-up.d/iptables

-or-

as you can see from installsnap.log the services didnt start.
the funny thing is they never start, not on reboot either
so you can just roll with it and enable the service whenever you wanna use it and disable it afterwards
maybe you can even alias the snap download + snap install commands to run a .sh to temporarily enable the service, run the command end disable it in the end.
pretty funny stuff
these are all you need:

ENABLE:
sudo systemctl start snapd.service
sudo systemctl start snapd.socket
sudo systemctl start snapd.seeded.service
DISABLE:
sudo systemctl stop snapd.service
sudo systemctl stop snapd.socket
sudo systemctl stop snapd.seeded.service
perma:
sudo systemctl disable snapd.service #permanant(do disable the service beforehand)
sudo systemctl reenable snapd.service #permanant

`NOTE: some people say disabling the service isnt perma, so you have to mask it instead: sudo systemctl mask snapd.service`

snap apparmor sometimes suicides so:
systemctl status apparmor
# "Yup, dead apparmor"
systemctl restart apparmor
snap restart lxd

26) install snap
from local .deb
snap set system snapshots.automatic.retention=no
dont forget to reboot
dont forget to add it to $PATH with 27)

27) add to $PATH


The following command adds a path to your current path:

export PATH=$PATH:/my/custom/path

If you want your setup to execute this command every time, there are a number of places where you can put it. When you login, the following scripts will be executed in this order:

/etc/profile      (which starts by loading everything in /etc/profile.d)
~/.profile        (which starts by loading ~/.bashrc if you are running bash)

Notes

    ~/.profile is only loaded if ~/.bash_profile and ~/.bash_login DO NOT EXIST. Otherwise, at least bash, will load them instead. It is advisable to use .profile and not the bash specific scripts. So, if in these attempts you created .bash_login, please delete it now.

    ~/.bashrc is only loaded if you are running an interactive session. (something with a prompt where you can actually type something).

    ~/.bashrc is loaded again and again, every time you open up a new terminal. So a new tab in gnome-terminal, a new virtual terminal, etc. So even if you don't login again, .bashrc is loaded (and thereby resets its environment) every time you open a new shell.

    Things like byobu should really go into .profile, (otherwise it won't work ;-)

    Things like paths should go into .profile if you want them to work outside of the interactive sessions. (say when you press Alt+F2 in GNOME)

28) xfce power manager
laptop lid -> switch off display for both settings
security -> automatically lock session -> NEVA

29) win+e -> file manager
keyboard -> application shortcuts -> add new: exo-open –launch FileManager
just adding "thunar" also works for xfce

30) turn monitor off
add a shortcut to CTRL+ALT+A -> bash -c 'sleep 0.3 &&xset dpms force off'
or force standby

31) tmux settings
put these into cfg
`

`



*) use startup notification on keyboard shortcuts
literally enables loading cursor if software supports it

*) keep on top
alt+f12 is the shortcut for that

*) funny minimize
window manager -> keyboard -> shade window

