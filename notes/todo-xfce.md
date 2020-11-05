ctrl+alt+f1
login.
sudo service lightdm restart
#to restart explorer.exe



set up thunderbird properly

look up the kde program notes, like dolphin and tohers

increase regular scroll speed, its so low, especially felt while scrolling a lot, maybe it doesn't register the input faster than 1ms? I cant be scrolling that fast. Or can I? :vsauce:

find a proper video player, or, wine mpc-hc
install flux or alternative

set up mpv with the smplayer multimedia engine or with celluloid



add kates cfgs to the .sh
"""
fix brightness shortcuts etc (autohotkey again?)
VOLUME CONTROL on mouse gesture.
bring back keyboard shortcuts for shit chromebook keyboard. Notably HOME END PGUP PGDOWN DELETE, BRIGHTNESS
"""

fix middle click for good

setup ssh for git

disable touchpad acceleration (is it still exists after g604 is fixed, but maybe, leave it on?)




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


Notes:
Useful keyboard shortcut list (in md form would be kreygasm)
Kazam is ok to record video (havent tried)

Keyboard shortcuts:
ctrl+esc: old start menu



17) middle click fix
This solution will work globally and preserve the middle mouse functionality.
Install xbindkeys xsel xdotool
Place this in ~/.xbindkeysrc
"echo -n | xsel -n -i; pkill xbindkeys; xdotool click 2; xbindkeys"
b:2 + Release
Reload xbindkeys -p
Run xbindkeys on startup(it auto added itself on kali20201b, NOP doesnt work on restart!! fix), pkill xbindkeys to stop.








*) 'use startup notification' on keyboard shortcuts
literally enables loading cursor if software supports it


