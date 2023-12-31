#!/bin/bash

FONT_DIR="$HOME/.local/share/fonts"
DOWNLOAD_DIR="$HOME/Downloads"

# fonts to be downloaded
fonts=("https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Go-Mono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/SourceCodePro.zip")

# make sure the local/share/font dir exists and create if not
if [ ! -d $FONT_DIR ]
then
  echo "It doesn't exists"
  echo "Creating the directory"
  mkdir -p $FONT_DIR
  echo "$FONT_DIR created"
fi

# make sure the ~/Downloads dir exists and create if not
if [ ! -d $DOWNLOAD_DIR ]
then
  echo "It doesn't exists"
  echo "Creating the directory"
  mkdir -p $DOWNLOAD_DIR
  echo "$DOWNLOAD_DIR created"
fi

# download the fonts
for font in ${fonts[@]}; do
  echo "Downloading $font"
  wget $font -O "$DOWNLOAD_DIR/${font##*/}"
done

# extract downloaded zips
for FILE in "$DOWNLOAD_DIR"/*; do
  echo "Unziping $FILE"
  unzip $FILE -x README.md -x LICENSE.txt -d "$FONT_DIR/"
done

# update the font cache
fc-cache -f -v

# remove zip files from Downloads
rm "$DOWNLOAD_DIR"/*.zip

echo '
    ______            __          ____           __        ____         __
   / ____/___  ____  / /______   /  _/___  _____/ /_____ _/ / /__  ____/ /
  / /_  / __ \/ __ \/ __/ ___/   / // __ \/ ___/ __/ __ `/ / / _ \/ __  / 
 / __/ / /_/ / / / / /_(__  )  _/ // / / (__  ) /_/ /_/ / / /  __/ /_/ /  
/_/    \____/_/ /_/\__/____/  /___/_/ /_/____/\__/\__,_/_/_/\___/\__,_/   
'
sleep 3
