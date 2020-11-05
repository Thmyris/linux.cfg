# Notes: 
# You can't seem to run tmux and run commands in tmux by typing a oneliner outside tmux.


alias xclip='xclip -selection clipboard'

alias ytdl-pl="youtube-dl --mark-watched --no-geo-bypass --yes-playlist -o '/home/thmyris/Desktop/youtube-downloads/%(uploader)s-%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' -v -f 'bestvideo[height<=1080][ext=mp4]+bestaudio/best[fps<=60]/best'"

alias ytdl="youtube-dl --mark-watched --no-geo-bypass --no-playlist -o '/home/thmyris/Desktop/youtube-downloads/%(uploader)s/%(title)s.%(ext)s' -v -f 'bestvideo[height<=1080][ext=mp4]+bestaudio/best[fps<=60]/best'"

alias ll='ls -lah --group-directories-first -S'

alias sec='cd /media/WIN/Users/Thmyris/Desktop/Files/sec'

alias sec0='cd /media/WIN/Users/Thmyris/Desktop/Files/sec/thm'

alias vpn0='sudo openvpn /media/WIN/Users/Thmyris/Desktop/Files/sec/thm/Thmyris.ovpn'

alias foobar='systemctl restart snapd.service && sleep 3 && systemctl restart apparmor && sleep 4 && foobar2000'

alias anki='~/files/anki-2.1.28-linux-amd64/bin/anki'

alias ip0="ip a | grep inet | tail -n 2 | head -n 1 | awk '{print \$2}' | cut -d '/' -f 1; ip a | grep inet | tail -n 2 | head -n 1 | awk '{print \$2}' | cut -d '/' -f 1 | xclip"

alias hashcat='~/files/hashcat-6.1.1/hashcat.bin'

alias defnmap='nmap -sC -sV -v $ip | tee defnmap.txt                       # default scan without file clutter'

alias rockyou=~/files/SecLists/Passwords/Leaked-Databases/rockyou.txt

alias sendlinpeas='nc -q 0 $ip 9001 < ~/files/linpeas.sh'

alias meddirs='python3 ~/files/dirsearch/dirsearch.py -u $ip -E --wordlist=/home/thmyris/files/SecLists/Discovery/Web-Content/directory-list-2.3-medium.txt | tee dirsearch-medium.log'

alias parrot='curl parrot.live'

alias ssx='searchsploit -x'

alias ssp='searchsploit'

alias extbuster='gobuster dir -w /home/thmyris/files/SecLists/Discovery/Web-Content/directory-list-2.3-medium.txt -e -l -u http://$ip -x php,txt,html | tee gobuster.log'

alias rust='rustscan $ip | tee rust.log'
