#!/bin/bash

# commands for initial setup
# should be run first

REPO_DIR="$HOME/repos"
WORK_DIR="$HOME/repos/bretOS"
WALLPAPER="ubuntu_aurora"
BIN_DIR="$HOME/.local/bin"

echo "Creating user directories"
# create xdg-user-dirs
xdg-user-dirs-update

# create the repository dir
mkdir $REPO_DIR
mkdir -p $BIN_DIR

# installing flatpak and other things
sudo apt update
sudo apt install flatpak curl wget htop neofetch unzip python3-venv python3-pip file xsel feh sxiv

# setup the flathub repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# setting up wallpapers
# default is to use the nord_blob wallpaper
mkdir -p $HOME/.wallpapers
# was having issues linking it, need to copy file
cp "$WORK_DIR/wallpapers/*" "$HOME/.wallpapers/"
echo '
 _       __      ____                                    ____           __        ____         __
| |     / /___ _/ / /___  ____ _____  ___  __________   /  _/___  _____/ /_____ _/ / /__  ____/ /
| | /| / / __ `/ / / __ \/ __ `/ __ \/ _ \/ ___/ ___/   / // __ \/ ___/ __/ __ `/ / / _ \/ __  / 
| |/ |/ / /_/ / / / /_/ / /_/ / /_/ /  __/ /  (__  )  _/ // / / (__  ) /_/ /_/ / / /  __/ /_/ /  
|__/|__/\__,_/_/_/ .___/\__,_/ .___/\___/_/  /____/  /___/_/ /_/____/\__/\__,_/_/_/\___/\__,_/   
                /_/         /_/
'
sleep 3

# copy over bashrc file
cp $WORK_DIR/dotconfig/.bashrc $HOME/
source $HOME/.bashrc

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source $HOME/.bashrc
nvm install --lts
echo '
    _   __          __        ____           __        ____         __
   / | / /___  ____/ /__     /  _/___  _____/ /_____ _/ / /__  ____/ /
  /  |/ / __ \/ __  / _ \    / // __ \/ ___/ __/ __ `/ / / _ \/ __  / 
 / /|  / /_/ / /_/ /  __/  _/ // / / (__  ) /_/ /_/ / / /  __/ /_/ /  
/_/ |_/\____/\__,_/\___/  /___/_/ /_/____/\__/\__,_/_/_/\___/\__,_/   

'
sleep 3

# install pfetch
git clone https://github.com/dylanaraps/pfetch ~/repos/pfetch
cd ~/.local/bin
ln -s $HOME/repos/pfetch/pfetch pfetch
echo '
    ____  ____     __       __       ____           __        ____         __
   / __ \/ __/__  / /______/ /_     /  _/___  _____/ /_____ _/ / /__  ____/ /
  / /_/ / /_/ _ \/ __/ ___/ __ \    / // __ \/ ___/ __/ __ `/ / / _ \/ __  / 
 / ____/ __/  __/ /_/ /__/ / / /  _/ // / / (__  ) /_/ /_/ / / /  __/ /_/ /  
/_/   /_/  \___/\__/\___/_/ /_/  /___/_/ /_/____/\__/\__,_/_/_/\___/\__,_/   

'
echo "Completed initial setup"
sleep 3
