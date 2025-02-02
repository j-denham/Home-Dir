#!/usr/bin/bash

# This script relies on a checkmarks.txt file. Before using this script,
# make sure :24 dir is the correct path to the supplied checkmarks.txt,
# then you should be ready to go! I usually just run this in a seperate
# little terminal window

# One weird thing about this script is that it spawns empty files with the name
# of yesterday and today's date in the current directory. I recommend defining an
# alias rmdates="rm 2020-*", just make sure you don't have any other files that match
# that regex >:)

function countdown(){
  date1=$((`date +%s` + $1));
  i=0
  while [ "$date1" -ge `date +%s` ]; do
    echo -ne "~ $(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
  done
  while [ $i -lt 10 ]; do
    echo "DONESKI!!!";
    ((i++))
  done
}

function addtally() {
  date=$(date +%Y-%m-%d);
  dir=~/Notes/checkmarks.txt
  yesterday=$(tail -n 1 ${dir} | head -n1 | cut -d " " -f1);
  if [ "$date" > $(date -d ${yesterday} +%Y-%m-%d) ] && [ "$date" != $(date -d ${yesterday} +%Y-%m-%d) ];  then
    # Adds a \n to end of file only if there isn't one already present
    sed -i -e '$a\' $dir
    printf "${date} I" >> ${dir}
  else
    # Adds a I with NO \n printf and echo add a \n by default
    sed -i "$ s/$/I/" $dir
  fi
}

countdown $((25*60))
addtally
