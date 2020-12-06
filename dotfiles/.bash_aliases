# Name: .bash_aliases
# Author: Thmyris
# Last update: 06.12.2020
# Note: It looks like you can't run tmux and run commands in tmux with a oneliner from outside tmux.

# Categories in order: 
# 0. uncategorized
# 1. navigation
# 2. security
# 3. other programs
# 4. changing alias xD

alias xclip='xargs echo -n | xclip -selection clipboard'

alias ll='ls -lah --group-directories-first -S'

alias parrot='curl parrot.live'

alias gm="echo 'Good morning Faruk!'"

alias gn="echo 'gn x8 from ID47'"

alias bt="sudo systemctl restart bluetooth"

alias btfix="pulseaudio --kill && sleep 5 && sudo pulseaudio --start"

alias lso="ls -alG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"

#-------------------security---------------------#

alias vpn0='sudo openvpn /media/WIN/Users/Thmyris/Desktop/Files/sec/thm/Thmyris.ovpn'

alias ip0="ip a show tun0 | awk 'NR==3 {print \$2}' | awk -F '[/:]' '{print \$1}'; ip a show tun0 | awk 'NR==3 {print \$2}' | awk -F '[/:]' '{print \$1}' | xclip"

alias defnmap='nmap -sC -sV -v $ip | tee defnmap.txt                       # default scan without file clutter'

alias sendlinpeas='nc -q 0 $ip 9001 < ~/files/linpeas.sh'

alias meddirs='python3 ~/files/dirsearch/dirsearch.py -u $ip -E --wordlist=/home/thmyris/files/SecLists/Discovery/Web-Content/directory-list-2.3-medium.txt | tee dirsearch-medium.log'

alias ssx='searchsploit -x'

alias ssp='searchsploit'

alias extbuster='gobuster dir -w /home/thmyris/files/SecLists/Discovery/Web-Content/directory-list-2.3-medium.txt -e -l -u http://$ip -x php,txt,html | tee gobuster.log'

alias rust='rustscan $ip | tee rust.log'

#-------------------/security---------------------#

#-------------------navigation--------------------#

alias sec='cd /media/WIN/Users/Thmyris/Desktop/Files/sec'

alias sec0='cd /media/WIN/Users/Thmyris/Desktop/Files/sec/thm'

alias down="cd ~/Downloads"

alias christmas="cd '/media/WIN/Users/Thmyris/Desktop/Files/sec/thm/adventofcyber2'"

#-------------------/navigation-------------------#

#-------------------other programs---------------------#

alias ytdl-pl="youtube-dl --mark-watched --no-geo-bypass --yes-playlist -o '/home/thmyris/Desktop/youtube-downloads/%(uploader)s-%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' -v -f 'bestvideo[height<=1080][ext=mp4]+bestaudio/best[fps<=60]/best'"

alias ytdl="youtube-dl --mark-watched --no-geo-bypass --no-playlist -o '/home/thmyris/Desktop/youtube-downloads/%(uploader)s/%(title)s.%(ext)s' -v -f 'bestvideo[height<=1080][ext=mp4]+bestaudio/best[fps<=60]/best'"

alias anki='~/files/anki-2.1.28-linux-amd64/bin/anki'

alias foobar='systemctl restart snapd.service && sleep 3 && systemctl restart apparmor && sleep 4 && foobar2000'

alias teamsdownload='./destreamer.sh -f list.txt -t "{title}-{author}-{publishDate}" -k -u "170401001@ogr.comu.edu.tr"'

#-------------------/other programs--------------------#












#this HAS TO BE at the bottom
alias alias="vim ~/.bash_aliases"
