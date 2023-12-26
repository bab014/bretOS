#!/bin/bash

# assumes fonts have been installed

WORK_DIR="$HOME/repos/bretOS/dotconfig"

# run the kitty installer script
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# cp over config
mkdir -p "$HOME"/.config/kitty
cp "$WORK_DIR"/kitty/* "$HOME"/.config/kitty/

mkdir "$HOME"/.local/bin
cd "$HOME"/.local/bin
ln -s "$HOME"/.local/kitty.app/bin/kitty kitty

echo "Kitty is now ready to use"
echo "Setting up starship now"

# starship download
curl -sS https://starship.rs/install.sh | sh

# copy over config
cp "$WORK_DIR"/starship.toml "$HOME"/.config/

echo "Terminal has been made nice"
