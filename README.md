# WallpaperShuffler
<p>A terminal program, written in bash, that allows you to randomly shuffle or conveniently choose a new wallpaper for your gnome desktop.</p>

## Setup
<p>Once the repo is downloaded, you will have to give the script permission to act as an executable on your device. This can be done using the command 'chmod u+x wallpaper.sh'.</p>

## Features
- 'list' command echos whole library and provides guidance
- Ability to choose for yourself, or let the program pick for you
- Case insensitive selection, no need to add file extensions yourself
- Can easily be set as a cron job to change background periodically

<h2>Usage</h2>
### Help Menu
<p>The help menu can be output by entering 'list' as a solitary positional argument. This menu will display all files in your 'Wallpapers' folder. The file extensions will be removed as
the file extensions aren't required to be input to select a background. There is also some basic instructions on using the tool, as well as a syntax guide and a basic example.</p>
### Syntax
<p>The syntax for this program is very simple. Just use the ./wallpaper.sh command to execute the script, and follow it up with any positional arguments that you may wish to use.<br>Generic Syntax: ./wallpaper.sh [ARGS]<br>If no arguments are used, a random wallpaper will be chosen. If you pass 'list' as an argument, the help menu comes up. If you pass any other string, it will be checked against the contents of the 'Wallpapers' folder to see if there is an image by that name. There may be no match for argument, if this is the case, an error message will be output and the program will be killed whilst the background will not change.</p>
