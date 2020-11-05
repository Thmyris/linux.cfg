#!/bin/bash 
hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x67
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x3000
# add this to sudo crontab -e
#@reboot /home/thmyris/files/fixscratchysound.sh
