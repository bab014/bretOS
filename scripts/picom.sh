#!/bin/bash

WORK_DIR="$HOME/repos/bretOS"

# installing and configuring picom
sudo apt install picom

# copy over config
mkdir -p "$HOME"/.config/picom
cp $WORK_DIR/dotconfig/picom/picom.conf "$HOME"/.config/picom/

echo "Picom has been installed and configured"
