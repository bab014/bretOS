#!/bin/bash

# commands for initial setup
# should be run first

REPO_DIR="$HOME/repos"
WORK_DIR="$HOME/repos/bretOS"
WALLPAPER="ubuntu_aurora"

# create xdg-user-dirs
xdg-user-dirs-update

# create the repository dir
mkdir $REPO_DIR

# installing flatpak and other things
sudo apt update
sudo apt install flatpak curl wget htop neofetch unzip python3-venv python3-pip file xsel

# setup the flathub repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install a browser
# BRAVE
flatpak install flathub com.brave.Browser
# FIREFOX
# flatpak install flathub org.mozilla.firefox

# setting up wallpapers
# default is to use the nord_blob wallpaper
mkdir -p $HOME/.wallpapers
# was having issues linking it, need to copy file
cp "$WORK_DIR/wallpapers/$WALLPAPER.png" "$HOME/.wallpapers/main.png"

# copy over bashrc file
cp $WORK_DIR/dotconfig/.bashrc $HOME/
source $HOME/.bashrc

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source $HOME/.bashrc
nvm install --lts
