#!/bin/bash


# base path variable
BASE_PATH=$HOME/wallpaper/Wallpapers


# if positional arg is null, choose random wallpaper
if [[ $1 = "list" ]]; then
	cd Wallpapers
	for FILE in *; do basename ${FILE%.*}; done
	cd ..
	
	echo ""
	echo ""
	echo "Note that you can manually select a file by passing the filename as a positional argument"
	echo "or you can leave it blank, which will select a random wallpaper"
	echo "Syntax:  ./wallpaper.sh [FILENAME]"
	echo "Example: ./wallpaper.sh miles"
	echo "(arguments are not case-sensitive)"
else
	if [[ -z $1 ]]; then
		# Wipe metadata.txt
		rm metadata.txt


		# If metadata.txt does not exist, create it
		if [[ ! -f "metadata.txt" ]]; then touch "metadata.txt"; fi 


		# get number of wallpapers
		cd Wallpapers
		DIR_LENGTH=$(ls | wc -l)
		cd ..


		# Write all files into metadata.txt
		cd Wallpapers
		for FILE in *; do echo $FILE >> ../metadata.txt; done
		cd ..


		# create array of background images, and select a random one
		CURR_BG=$(gsettings get org.gnome.desktop.background picture-uri)
		IMG_ARRAY=($(cat metadata.txt))
		NEW_BG=${IMG_ARRAY[$RANDOM % DIR_LENGTH + 1]}
		if [[ $NEW_BG = $CURR_BG ]]; then
			while [[ $NEW_BG = $CURR_BG ]]; do
				NEW_BG=${IMG_ARRAY[$NEW_BG]}
			done
		fi
	else
		# Find file in $1 in 'Wallpapers' directory
		if [[ -z $1 ]]; then
			echo "ERR: File given as positional argument does not exist"
		else
			# Find file named $1 in 'Wallpapers' directory and assign the 14th character onwards to NEW_BG
			NEW_BG=$(find -iname "$1.*" | cut -c 14-)

			if [[ $(wc -w <<< $NEW_BG) > 1 ]]; then
				echo "ERR: there are multiple images saved images with this name ($NEW_BG)"
				exit
			fi
		fi
	fi

	gsettings set org.gnome.desktop.background picture-uri "$BASE_PATH/$NEW_BG"
fi
