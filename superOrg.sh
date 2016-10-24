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

mkdir -p ./$dt/images
mkdir -p ./$dt/videos
mkdir -p ./$dt/songs
mkdir -p ./$dt/documents
mkdir -p ./$dt/other

find . -maxdepth 1 -type f  \( -iname '*.jpg' -or -iname '*.jpeg' -or -iname '*.png' -or -iname '*.gif'  \) -exec mv {} ./$dt/images \;
find . -maxdepth 1 -type f  \( -iname '*.3gp' -or -iname '*.mkv' -or -iname '*.mp4' -or -iname '*.flv'  \) -exec mv {} ./$dt/videos \;
find . -maxdepth 1 -type f  \( -iname '*.txt' -or -iname '*.odf' -or -iname '*.pdf' -or -iname '*.doc' -or -iname '*.docx' -or -iname '*.ppt' -or -iname '*.pptx' \) -exec mv {} ./$dt/documents \;
find . -maxdepth 1 -type f -iname "*.mp3" -exec mv {} ./$dt/songs \;
find . -maxdepth 1 -type f  -exec mv {} ./$dt/other \;

exit 0
