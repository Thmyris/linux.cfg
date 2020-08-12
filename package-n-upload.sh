#!/bin/bash
# Name: package-n-upload.sh for kali linux 2020.1b
# Author: Thmyris
# Last update: 12.08.2020
# About: This script automatically detects big files and packages them for github and optionally pushes all changes to the Thmyris/linux.cfg repository.
#--------------------------------------------------
echo -e "MAKE SURE TO RUN BEFORESETUP.SH BEFORE RUNNING THIS";
echo -e "DO NOT RUN THIS FILE or BEFORESETUP.SH TWICE IN A ROW IT'LL MESS UP everything";
while true; do
    read -p "Do you wish to continue?(y/n): " yesno
    case $yesno in
        [Yy]* ) break;;
        [Nn]* ) exit 1;;
        * ) echo "Please answer yes or no.";;
    esac
done
#--------------------------------------------------

# put filenames bigger than 95MB into bigfiles
find -size +95000000c | grep -v "/.git/" > bigfiles

# assign number of bigfiles to a bash var
bigfiles_lines=$(wc -l bigfiles | awk '{print $1}')

# bash loop to read file paths into variables
# What this does: stores paths of files to be zipped into env vars named $file1...$file999
# To print the 2nd line and then stop processing add the q (for quit) command (you also need braces to group the 2 commands together), i.e. sed -n '2{p;q;}' bigfiles
# Dont forget to assign $bigfiles_lines beforehand, otherwise you can create an infinite loop
counter=1
until [ $counter -gt $bigfiles_lines ]
do
read file$counter < <(sed -n "$counter{p;q;}" bigfiles)
# This black magic is brought to you by: https://stackoverflow.com/a/12675950. 1 redirect causes 'ambigous redirect'(something along those lines) error. Using file2=$(sed..) causes the errors when you use file$counter=.. In short, this was the only way I could find that was working properly.
((counter++))
done

# loop to package previously read file paths into 95mib chunks
counter=1
until [ $counter -gt $bigfiles_lines ]
do
# I will now use a bash black magic called "Indirect parameter expansion" courtesy of: https://stackoverflow.com/a/16553351. This is to fix ${var${counter}}'s 'bad substitution' error.
file=file$counter
7z a -v95m -sdel "${!file}".7z "${!file}" #95m means mib
((counter++))
done

read -p "Packaging is complete, do you want to continue committing changes and upload to github? <y/n>: " prompt
if [[ $prompt == "n" || $prompt == "N" ]]
then
  exit 0;
fi

git add .
git status
read -p "Press enter to commit and upload. If not, please CTRL+C and 'git reset'."
git commit -m "++"
git push origin master
