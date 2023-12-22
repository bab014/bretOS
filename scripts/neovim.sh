#!/bin/bash

# building and installing neovim

REPO_DIR="$HOME/repos"
WORK_DIR="$HOME/repos/bretOS"
NEOVIM_DIR="$REPO_DIR/neovim"

# install build dependencies
sudo apt update
sudo apt install ninja-build gettext cmake unzip curl

# clone neovim repo
git clone https://github.com/neovim/neovim $REPO_DIR/neovim

# change into neovim directory and build
cd $NEOVIM_DIR && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd $NEOVIM_DIR/build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

echo "Neovim installed"

echo "Creating python virtual environment for neovim"
mkdir $HOME/.pyvenvs
cd $HOME/.pyvenvs
python3 -m venv pynvim
cd $HOME/.pyvenvs/pynvim/
bin/pip install pynvim

# clone my neovim config
git clone https://github.com/bab014/nvim-cfg $HOME/.config/nvim

echo "Neovim config cloned over"
echo "Try opening Neovim and running checkhealth"
