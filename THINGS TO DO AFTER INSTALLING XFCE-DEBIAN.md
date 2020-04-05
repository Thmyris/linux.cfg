disable workspaces (maybe not?)
disable middle click c&p -> https://unix.stackexchange.com/questions/24330/how-can-i-turn-off-middle-mouse-button-paste-functionality-in-all-programs



alt->f2 to win->r
find notepad++ alternative
find a way to use foobar, not something else.
find a proper video player, or, wine mpc-hc
install flux or alternative
ctrl alt a -> turn monitor off
set up mpv with the smplayer multimedia engine
win e to open thunar on home or root

startup programs (how does startup mgmt work in liunux?)
fix brightness shortcuts etc (autohotkey again?)

maybe setup ssh for git



Done:
move start menu to bottom
alt+f4 -> F4 (i have a ahk script?: no, theres already a setting to change alt f4)
shortcut terminal win t
win d to desktop



Things that were alredady done in kali:
install tmux


1) mouse sens
settings editor -> pointers -> Logitech_G604_:
acceleration Double 3.0 (this doesnt mean maccel -_-)
RightHanded Boolean TICK
Threshold Integer 1920

2) package man (i didnt use this one)
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
alt+f2 OR alt+f3 (adv)
NOTE: This is different from start menu finder

13) volume control
microphone @ %50 is good.

14) xfce4-screenshooter
shift+printscreen
xfce4-shreenshooter --region -> Ctrl + ]
xfce4-screenshooter --window -> Ctrl + [

15) GIT INIT
git config --global user.email thmyris@windowslive.com
git config --global user.name "Ahmet Albayrak"



*) use startup notification on keyboard shortcuts
literally enables loading cursor if software supports it

*) keep on top
alt+f12 is the shortcut for that

*) funny minimize
window manager -> keyboard -> shade window

