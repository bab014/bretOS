#!/bin/bash

# commands for initial setup
# should be run first

WORK_DIR="$HOME/repos/bretOS"
WALLPAPER="nord_blob"

# installing flatpak and other things
sudo apt update
sudo apt install flatpak curl wget htop neofetch

# setup the flathub repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install a browser
# BRAVE
flatpak install flathub com.brave.Browser
# FIREFOX
flatpak install flathub org.mozilla.firefox

# setting up wallpapers
# default is to use the nord_blob wallpaper
mkdir -p $HOME/.wallpapers
ln -s "$WORK_DIR/wallpapers/$WALLPAPER.png" "$HOME/.wallpapers/main.png"
