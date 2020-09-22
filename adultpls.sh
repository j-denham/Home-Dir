#!/usr/bin/bash

dir=~/Notes

# Calling this script will automatically redirect to the notes specified by the command
# Just add another elif statement with the path to your notes file if you want to add another one
if [ $1 = "vim" ]; then
   vim ${dir}/vim-notes.txt
elif [ $1 = "commands" ]; then
   vim ${dir}/commands.txt
elif [ $1 = "git" ]; then
   vim ${dir}/git-commands.txt
elif [ $1 = "scripts" ]; then
   vim ${dir}/scripting.txt
elif [ $1 = "recipes" ]; then
   vim ${dir}/recipes.txt
elif [ $1 = "help" ]; then
   echo -e "\nCan help you out with\n -> vim\n -> commands\n -> git\n -> bash scripting {scripts}\n -> cooking {recipes}\n"
else
   echo -e "Ur not making sense cunt\n"   
fi


