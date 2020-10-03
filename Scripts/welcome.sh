#!/usr/bin/bash

# This script is meant to be run when you open your terminal.
# Literally add the path to this script at the top of your .bashrc
# after replacing with you own details and you should be good to go. 

# Takes a date string in the format yyyymmdd
function dateDiff() {
  echo $(( (`date -d $1 +%s` - `date +%s`) / (60*60*24) ))
}

greeting="Welcome"
user="Jiles"
day=$(date +%A)
sched="On the agenda for today:\n\n"

echo -e "\n$greeting back $user! Today is $day mofo so kick your ass into gear!\n"
echo -e "Take initiative my man, enjoy, and happy hacking :D\n\n"

# Timetable for sem 2 2020

if [ $day == "Monday" ]; then
  echo -e "$sched  12:00-13:00 -> IT Project Lecture\n  ~14:00-TBD -> Jinx Group Meeting\n  15:15-16:15 -> IT Project Workshop\n\n" 
elif [ $day == "Tuesday" ]; then
  echo -e "$sched  16:15-18:15 -> Models of Comp Lecture\n\n"
elif [ $day == "Wednesday" ]; then
  echo -e "$sched  16:15-17:15 -> Declarative Workshop\n\n"
elif [ $day == "Thursday" ]; then
  echo -e "$sched  11:00-12:00 -> Declarative Lecture\n  14:00-TBD -> IT Project Standup Meeting\n  15:15-17:15 -> Models of Comp Tutorial\n\n"
elif [ $day == "Friday" ]; then
  echo -e "$sched  12:00-13:00 -> Declarative Lecture\n  14:00-17:00 -> Cosmos Prac\n\n"
fi

echo -e "Deadlines\n -> Models of Comp Assignment 2 is due in $(dateDiff $(("20201025"))) days!\n -> Models of Comp WS4 is due in $(dateDiff $(("20201018"))) days!\n\n"
echo -e "Backlog\n -> Abstract API calls in edit to useUser\n -> Watch last week's Models of Comp lecture\n -> Do some styling for the Portfolio page\n"
