#!/bin/bash

SRC_DIR="$HOME/.local/src"
LOCAL_BIN_DIR="$HOME/.local/bin"
QTILE_BIN="$HOME/.local/src/qtile_venv/bin/qtile"
QTILE_CONFIG="$HOME/repos/bretOS/dotconfig/qtile"
REPO_DIR="$HOME/repos/bretOS/dotconfig/"

# dependencies
echo '
  ____  __  _ __      ___             
 / __ \/ /_(_) /__   / _ \___ ___  ___
/ /_/ / __/ / / -_) / // / -_) _ \(_-<
\___\_\__/_/_/\__/ /____/\__/ .__/___/
                           /_/
'
sudo apt install xorg xserver-xorg python3 python3-pip python3-venv python3-v-sim python-dbus-dev libpangocairo-1.0-0 python3-xcffib python3-cairocffi libxkbcommon-dev libxkbcommon-x11-dev -yy

# creating src folder
mkdir -p $SRC_DIR

# checking for .local/bin folder
if [! -d $LOCAL_BIN_DIR ]
then
  echo "$LOCAL_BIN_DIR not found. Creating"
  mkdir -p $LOCAL_BIN_DIR
fi

# create the virtual env
echo '
  _   ___     __                
 | | / (_)___/ /_  ___ ___ _  __
 | |/ / / __/ __/ / -_) _ \ |/ /
 |___/_/_/  \__/  \__/_//_/___/ 
                                
'
cd $SRC_DIR
python3 -m venv qtile_venv

# get the qtile repo
cd $SRC_DIR/qtile_venv
git clone https://github.com/qtile/qtile.git

# pip install qtile
echo '
   ____         __       _____             ____  __  _ __   
  /  _/__  ___ / /____ _/ / (_)__  ___ _  / __ \/ /_(_) /__ 
 _/ // _ \(_-</ __/ _ `/ / / / _ \/ _ `/ / /_/ / __/ / / -_)
/___/_//_/___/\__/\_,_/_/_/_/_//_/\_, /  \___\_\__/_/_/\__/ 
                                 /___/
'
bin/pip install qtile/.
# need to actually install this
bin/pip install distro

# symlink qtile binary to .local/bin
ln -s $QTILE_BIN "$LOCAL_BIN_DIR"/qtile

# move config files for qtile
echo '
   __  ___         _             _____          ____     
  /  |/  /__ _  __(_)__  ___ _  / ___/__  ___  / _(_)__ _
 / /|_/ / _ \ |/ / / _ \/ _ `/ / /__/ _ \/ _ \/ _/ / _ `/
/_/  /_/\___/___/_/_//_/\_, /  \___/\___/_//_/_//_/\_, / 
                       /___/                      /___/
'
mkdir -p $HOME/.config/qtile
cp $QTILE_CONFIG/* $HOME/.config/qtile/
cp $REPO_DIR/.xinitrc $HOME/
cp $REPO_DIR/.xprofile $HOME/

echo '
   ____  __  _ __        ____           __        ____         __
  / __ \/ /_(_) /__     /  _/___  _____/ /_____ _/ / /__  ____/ /
 / / / / __/ / / _ \    / // __ \/ ___/ __/ __ `/ / / _ \/ __  / 
/ /_/ / /_/ / /  __/  _/ // / / (__  ) /_/ /_/ / / /  __/ /_/ /  
\___\_\__/_/_/\___/  /___/_/ /_/____/\__/\__,_/_/_/\___/\__,_/   

'
sleep 3
