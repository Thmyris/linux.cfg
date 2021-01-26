#!/bin/bash
 
# Counting total number of arguments
echo "Total number of arguments : $#"
 
# Reading argument values individually
echo "First argument value : $1"
echo "Second argument value : $2"
echo "Third argument value : $3"
 
# Reading argument values using loop
for argval in "$@"
do
  echo -n "$argval  "
done
 
# Adding argument values
sum=$(($1+$2+$3))
 
# print the result
echo -e "\nResult of sum = $sum"
 
