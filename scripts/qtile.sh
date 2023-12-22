#!/bin/bash

SRC_DIR="$HOME/.local/src"
LOCAL_BIN_DIR="$HOME/.local/bin"
QTILE_BIN="$HOME/.local/src/qtile_venv/bin/qtile"
QTILE_CONFIG="$HOME/repos/bretOS/dotconfig/qtile"
REPO_DIR="$HOME/repos/bretOS/dotconfig/"

# dependencies
sudo apt install xorg xserver-xorg python3 python3-pip python3-venv python3-v-sim python-dbus-dev libpangocairo-1.0-0 python3-xcffib python3-cairocffi libxkbcommon-dev libxkbcommon-x11-dev -yy

# checking for src folder
if [! -d $SRC_DIR ]
then
  echo "$SRC_DIR not found. Creating"
  mkdir -p $SRC_DIR
fi

# checking for .local/bin folder
if [! -d $LOCAL_BIN_DIR ]
then
  echo "$LOCAL_BIN_DIR not found. Creating"
  mkdir -p $LOCAL_BIN_DIR
fi

# create the virtual env
cd $SRC_DIR
python3 -m venv qtile_venv

# get the qtile repo
cd $SRC_DIR/qtile_venv
git clone https://github.com/qtile/qtile.git

# pip install qtile
bin/pip install qtile/.

# symlink qtile binary to .local/bin
ln -s $QTILE_BIN "$LOCAL_BIN_DIR"/qtile

# move config files for qtile
mkdir -p $HOME/.config/qtile
cp $QTILE_CONFIG/* $HOME/.config/qtile/
cp $REPO_DIR/.xinitrc $HOME/
cp $REPO_DIR/.xprofile $HOME/

echo "Qtile installed and configured, you can reboot"
