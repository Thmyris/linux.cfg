# Notes: 
# You can't seem to run tmux and run commands in tmux by typing a oneliner outside tmux.


alias xclip='xclip -selection clipboard'

alias ytdl-pl="youtube-dl --mark-watched --no-geo-bypass --yes-playlist -o '/home/thmyris/Desktop/youtube-downloads/%(uploader)s-%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' -v -f 'bestvideo[height<=1080][ext=mp4]+bestaudio/best[fps<=60]/best'"

alias ytdl="youtube-dl --mark-watched --no-geo-bypass --no-playlist -o '/home/thmyris/Desktop/youtube-downloads/%(uploader)s/%(title)s.%(ext)s' -v -f 'bestvideo[height<=1080][ext=mp4]+bestaudio/best[fps<=60]/best'"

alias ll='ls -lah --group-directories-first -S'

alias sec='cd /media/WIN/Users/Thmyris/Desktop/Files/sec'

alias vpn0='sudo openvpn /media/WIN/Users/Thmyris/Desktop/Files/sec/thm/Thmyris.ovpn'

alias foobar='systemctl restart snapd.service && sleep 5 && systemctl restart apparmor && sleep 5 && foobar2000'

alias anki='~/files/anki-2.1.28-linux-amd64/bin/anki'
