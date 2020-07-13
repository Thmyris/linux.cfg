#!/bin/bash
# Name: beforesetup.sh for kali linux 2020.1b
# Author: Thmyris
# Last update: 13.07.2020
# About: This script is for unarchiving the files that were packaged to bypass github's mib limit. May require internet connection for 7z dependencies.

echo "This script will only get the archived files out. This should take a min..."

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

echo "You can run setup.sh now."
