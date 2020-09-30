#!/usr/bin/bash

greeting="Welcome"
user="Jiles"
day=$(date +%A)
sched="On the agenda for today:\n\n"

echo -e "\n$greeting back $user! Today is $day mofo so kick your ass into gear!\n"
echo -e "Take initiative my man, enjoy, and happy hacking :D\n\n"

# Timetable for sem 2 2020

if [ $day == "Monday" ]; then
  echo -e "$sched  12:00-13:00 -> IT Project Lecture\n  ~14:00-TBD -> IT Project Group Meeting\n  15:15-16:15 -> IT Project Workshop\n\n" 
elif [ $day == "Tuesday" ]; then
  echo -e "$sched  16:15-18:15 -> Models of Comp Lecture\n\n"
elif [ $day == "Wednesday" ]; then
  echo -e "$sched  16:15-17:15 -> Declarative Workshop\n\n"
elif [ $day == "Thursday" ]; then
  echo -e "$sched  11:00-12:00 -> Declarative Lecture\n  14:00-TBD -> IT Proj Standup Meeting\n  15:15-17:15 -> Models of Comp Tutorial\n\n"
elif [ $day == "Friday" ]; then
  echo -e "$sched  12:00-13:00 -> Declarative Lecture\n  14:00-17:00 -> Cosmos Prac\n\n"
fi

echo -e "Deadlines\n -> Models of Comp Assignment 2 Due 25/10\n -> Models of Comp WS4 Due 18/10\n\n"
echo -e "Backlog\n -> Set up API call for home portfolio upon login of a User\n -> Catch up on Declarative and Models of Comp\n -> Do some styling for the Portfolio page\n"
# Add Deadlines when they come
