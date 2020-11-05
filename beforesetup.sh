#!/bin/bash
# Name: beforesetup.sh for kali linux 2020.1b
# Author: Thmyris
# Last update: 05.11.2020
# About: This script is for unarchiving the files that were packaged to bypass github's mib limit. May require internet connection for 7z dependencies.
#--------------------------------------------

echo -e "If you had to CTRL^C while running this script, you'll have to continue unpacking manually.";
while true; do
    read -p "Do you wish to continue unpacking automatically?(y/n): " yesno
    case $yesno in
        [Yy]* ) break;;
        [Nn]* ) echo "Goodbye!"; exit 1;;
        * ) echo "Please answer with a y or n.";;
    esac
done

FILE=bigfiles
if [ -f "$FILE" ]; then
    echo ""
else
    echo "$FILE file doesn't exist, there's nothing to unpack, quitting..."
    exit 1;
fi

echo "This script will only get the archived files out. This should take a min..."

#--------------------------------------------
echo "Installing 7z to unzip 'bigfiles'. May require internet connection for dependencies."
sudo apt install ./deb/p7zip_16.02+dfsg-7_amd64.deb
echo "done"

# assign number of bigfiles to a bash var
bigfiles_lines=$(wc -l bigfiles | awk '{print $1}')
echo "%10 complete"

# bash loop to read relative file paths into env variables named $file1...$file999
# To print the 2nd line and then stop processing add the q (for quit) command (you also need braces to group the 2 commands together), i.e. sed -n '2{p;q;}' bigfiles
counter=1
until [ $counter -gt $bigfiles_lines ]
do
read file$counter < <(sed -n "$counter{p;q;}" bigfiles)
# This black magic is brought to you by: https://stackoverflow.com/a/12675950. 1 redirect causes 'ambigous redirect'(something along those lines) error. Using file2=$(sed..) causes the errors when you use file$counter=.. In short, this was the only way I could find that was working properly.
((counter++))
done
echo "%20 complete"

# loop to unpackage
counter=1
until [ $counter -gt $bigfiles_lines ]
do
# I will now use a bash black magic called "Indirect parameter expansion" courtesy of: https://stackoverflow.com/a/16553351. This is to fix ${var${counter}}'s 'bad substitution' error.
file=file$counter
7z x "${!file}.7z.001" -so > "${!file}"
rm "${!file}".7z*
((counter++))
done
echo "%99 complete"

mv bigfiles bigfiles_unpacked
echo "%100 complete"

echo "Unpacking complete! You can run setup.sh now."
