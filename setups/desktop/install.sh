#!/bin/bash

# Function to get user input
function yesno() {
	read choice
	case "$choice" in 
		[yY][eE][sS] ) echo yes;;
		[nN][oO]     ) echo no;;
		* ) exit;;
	esac
}

# Bold and normal fonts
bold=$(tput bold)
normal=$(tput sgr0)

# Files to copy to home folder
files=(  \
	 .xmonad/*\
       	 .xsessionrc\
	 .xmobarrc\
	 .stalonetrayrc\
      )

# Prompt for confirmation
echo -n "This will overwrite your current config. Are you sure? [yes/NO]? "

while true;
do
	reply=$(yesno)
	if [[ "yes" == $reply ]]
	then
		break
	elif [[ "no" == $reply ]]
	then
		exit 1
	fi
	echo -n "Please answer \"yes\" or \"no\": "
done

# Copy files
echo "Copying files to $HOME..."

for i in "${files[@]}";
do
	echo "${bold}$i${normal}"
	cp --parents $i $HOME 
done

echo "Done."
