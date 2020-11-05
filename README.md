## my linux cfg files
This is my linux configuration folder for getting Kali-2020.2 ready to go in under 10 mins right after a reformat.

0. open a terminal in the linux.cfg folder
1. run ./beforesetup.sh
2. run ./setup.sh (AKA install.sh)
3. reboot
4. run ./aftersetup.sh
5. read setup.txt
6. run ./SELF_DESTRUCT

#### Changelog:
##### v4(Nov 2020):
- Improved stability, added safety checks to ensure everything goes smoothly in case of a possible error.
- Added more verbosity
- *setup.sh:* Automated .deb file detection and installation so I won't have to manually add a line to my setup.sh whenever I add another .deb file to the deb folder. Thanks @cansozbir for the oneliner!

##### v3(big revamp for 3rd re-format):
- Completely automated the git-lfs bypass (spending hours on this is faster than making a .deb file for git-lfs from source bcs kali doesn't have one). Hence added package-n-upload.sh
- Wrote the code to automate installing .deb files without manual file name / version checking in setup.sh, but too tired to implement rn.
- Colorized setup.sh's output

##### v2(small revamp for 2nd re-format):
- Added verbosity

##### v1(initial release):
- Prepared a half-automated setup script
- *setup.sh files run mostly without manual interruption but any change to the files requires manual interruption, i.e. changing file .deb file names in setup.sh and manually zipping every file for bypass.
- Can automatically install almost everything I need with 2-3 clicks
