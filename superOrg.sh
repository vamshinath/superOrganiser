#!/bin/bash
clear
echo -e "\n\t\tHi $USER"
if (( !$# ))
then
	read -p "Enter Directory to Organize:" dr
	cd $dr
	if (( $? ))
	then 
		read -p "Please Enter Correct Path:" dr
		cd $dr
		if (( $? ))
		then
			echo "Usage:./superOrg.sh  dir_name"
			exit 0
		fi
	fi
else
	cd $1
	if (( $? ))
	then
		echo -e "\n\t WRONG PATH"
		echo "Usage:./superOrg.sh  dir_name"
		sleep 0.2
		exit 0
	fi
fi

echo "SUCCESS"
dt=$(date +"%d-%m-%y" )
mkdir $dt
touch $dt/.tmp.txt
if (( $? ))
then
	echo "Problem Encountered"
else
	rm $dt/.tmp.txt
	clear
	echo "SUCCESS2"
fi



