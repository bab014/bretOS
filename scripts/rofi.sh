#!/bin/bash

ROFI_DIR="$HOME/.config/rofi"

# install rofi
sudo apt install rofi

# create rofi dir
mkdir -p $ROFI_DIR

# clone the themes repo
git clone https://github.com/adi1090x/rofi.git "$HOME/repos/rofi"
cd "$HOME/repos/rofi"
chmod +x setup.sh
./setup.sh

echo "Rofi is ready"
