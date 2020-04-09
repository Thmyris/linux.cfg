youtube-dl --mark-watched --no-geo-bypass --no-playlist -o '/home/thmyris/Desktop/youtube-downloads/%(uploader)s/%(title)s.%(ext)s' -v -f 'bestvideo[height<=1080][ext=mp4]+bestaudio/best[fps<=60]/best' 'https://www.youtube.com/watch?v=I7GgBjVJjFo'
read -p "Press [Enter] key to continue..."
