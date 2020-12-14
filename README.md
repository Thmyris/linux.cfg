# linux.cfg
##### Last updated: 14.12.2020
## What is this repository?
This repo contains all the programs I use on a daily basis. The scripts here are used to install those programs and get Kali-2020.3-xfce ready to use in under 10 mins right after a re-format. Because I re-format often, I felt like automating the initial setup and here we are.

#### What does [`setup.sh`](https://github.com/Thmyris/linux.cfg/blob/master/setup.sh) (AKA install.sh) do?
- Installs all the files in the [`deb`](https://github.com/Thmyris/linux.cfg/tree/master/deb) folder
- Installs additional packages using live repos.
- Adds debian repos
- Disables external mouse acceleration
- Adds additional fonts
- Sets the windows partition to automount on startup
- Copies over my [`dotfiles`](https://github.com/Thmyris/linux.cfg/tree/master/dotfiles)(.config, .bash_aliases etc.)
    - Copies over all my XFCE UI settings.
    - Copies over all my program settings.
- Copies over my [`files`](https://github.com/Thmyris/linux.cfg/tree/master/files) folder (Mostly pentesting tools)

#### What does [`beforesetup.sh`](https://github.com/Thmyris/linux.cfg/blob/master/beforesetup.sh) do?
- Unpacks archived files.
 
#### What does [`aftersetup.sh`](https://github.com/Thmyris/linux.cfg/blob/master/aftersetup.sh) do?
- Runs the final commands that needs to be run after a reboot.

## Usage
1. Open a `/bin/bash` terminal in the linux.cfg folder
2. [`./beforesetup.sh`](https://github.com/Thmyris/linux.cfg/blob/master/beforesetup.sh)
3. [`./setup.sh`](https://github.com/Thmyris/linux.cfg/blob/master/setup.sh)
4. Reboot
5. [`./aftersetup.sh`](https://github.com/Thmyris/linux.cfg/blob/master/aftersetup.sh)
6. Read [setup.txt](https://github.com/Thmyris/linux.cfg/blob/master/setup.txt)
7. `./SELF_DESTRUCT` :)


#### Changelog:
##### v4(Nov 2020):
- Improved stability a ton. Added safety checks to ensure everything goes smoothly in case of a possible error.
- Added more verbosity
- *setup.sh:* Automated .deb file detection and installation so I won't have to manually add a line to my setup.sh whenever I add another .deb file to the deb folder. Thanks @cansozbir for the oneliner!

##### v3(big revamp for 3rd re-format):
- Completely automated the git-lfs bypass (spending hours on this is faster than making a git-lfs package from source because kali doesn't have one). Hence added package-n-upload.sh
- Wrote the code to automate installing .deb files without manual file name checking in setup.sh, but too tired to implement rn.
- *setup.sh:* added lots of colors =)

##### v2(small revamp for 2nd re-format):
- Added verbosity

##### v1(initial release):
- Prepared a half-automated setup script(setup.sh). It runs mostly without manual interruption but any change to the deb files require manually changing the file names in setup.sh.
- I have to manually zip every file for git-lfs bypass.
