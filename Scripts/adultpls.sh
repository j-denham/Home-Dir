#!/usr/bin/bash

# Super simple and fast redirection to any notes you may have straight from
# the command line. Use with an alias adultpls="~/<path>/adultpls.sh", and 
# highly recommended you install gruvbox for vim otherwise it'll look like shit

dir=~/Notes

if [ $1 = "vim" ]; then
   vim ${dir}/vim-notes.txt
elif [ $1 = "commands" ]; then
   vim ${dir}/commands.txt
elif [ $1 = "git" ]; then
   vim ${dir}/git-commands.txt
elif [ $1 = "scripts" ]; then
   vim ${dir}/scripting.txt
elif [ $1 = "haskell" ]; then
   vim ${dir}/haskell.txt
elif [ $1 = "prolog" ]; then
   vim ${dir}/prolog.txt
elif [ $1 = "javascript" ]; then
   vim ${dir}/javatypescript-notes.md
elif [ $1 = "react" ]; then
   vim ${dir}/react.txt
elif [ $1 = "django" ]; then
   vim ${dir}/django.md
elif [ $1 = "webdev" ]; then
   vim ${dir}/webdev.md
elif [ $1 = "recipes" ]; then
   vim ${dir}/recipes.md
elif [ $1 = "help" ]; then
   echo -e "\nCan help you out with\n -> vim\n -> commands\n -> git\n -> bash scripting {scripts}\n -> haskell\n -> prolog\n -> javascript\n -> react\n -> django\n -> {webdev} concepts\n -> cooking {recipes}\n"
else
   echo -e "Ur not making sense >:(\n"   
fi


