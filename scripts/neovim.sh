#!/bin/bash

# building and installing neovim

REPO_DIR="$HOME/repos"
WORK_DIR="$HOME/repos/bretOS"
NEOVIM_DIR="$REPO_DIR/neovim"

echo '
    ____           __        _____                _   __                _         
   /  _/___  _____/ /_____ _/ / (_)___  ____ _   / | / /__  ____ _   __(_)___ ___ 
   / // __ \/ ___/ __/ __ `/ / / / __ \/ __ `/  /  |/ / _ \/ __ \ | / / / __ `__ \
 _/ // / / (__  ) /_/ /_/ / / / / / / / /_/ /  / /|  /  __/ /_/ / |/ / / / / / / /
/___/_/ /_/____/\__/\__,_/_/_/_/_/ /_/\__, /  /_/ |_/\___/\____/|___/_/_/ /_/ /_/ 
                                     /____/
'

# install build dependencies
echo '
   ___                       __             _       
  / _ \___ ___  ___ ___  ___/ /__ ___  ____(_)__ ___
 / // / -_) _ \/ -_) _ \/ _  / -_) _ \/ __/ / -_|_-<
/____/\__/ .__/\__/_//_/\_,_/\__/_//_/\__/_/\__/___/
        /_/
'
sudo apt update
sudo apt install ninja-build gettext cmake unzip curl

# clone neovim repo
echo '
  _______          _                      _     
 / ___/ /__  ___  (_)__  ___ _  ___ _  __(_)_ _ 
/ /__/ / _ \/ _ \/ / _ \/ _ `/ / _ \ |/ / /  ` \
\___/_/\___/_//_/_/_//_/\_, / /_//_/___/_/_/_/_/
                       /___/
'
git clone https://github.com/neovim/neovim $REPO_DIR/neovim

# change into neovim directory and build
echo '
   ___       _ __   ___          
  / _ )__ __(_) /__/ (_)__  ___ _
 / _  / // / / / _  / / _ \/ _ `/
/____/\_,_/_/_/\_,_/_/_//_/\_, / 
                          /___/
'
cd $NEOVIM_DIR && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd $NEOVIM_DIR/build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

echo '
    _   __                _              ____           __        ____         __
   / | / /__  ____ _   __(_)___ ___     /  _/___  _____/ /_____ _/ / /__  ____/ /
  /  |/ / _ \/ __ \ | / / / __ `__ \    / // __ \/ ___/ __/ __ `/ / / _ \/ __  / 
 / /|  /  __/ /_/ / |/ / / / / / / /  _/ // / / (__  ) /_/ /_/ / / /  __/ /_/ /  
/_/ |_/\___/\____/|___/_/_/ /_/ /_/  /___/_/ /_/____/\__/\__,_/_/_/\___/\__,_/   

'

echo '
   ___       __  __               _   __            
  / _ \__ __/ /_/ /  ___  ___    | | / /__ ___ _  __
 / ___/ // / __/ _ \/ _ \/ _ \   | |/ / -_) _ \ |/ /
/_/   \_, /\__/_//_/\___/_//_/   |___/\__/_//_/___/ 
     /___/
'
mkdir $HOME/.pyvenvs
cd $HOME/.pyvenvs
python3 -m venv pynvim
cd $HOME/.pyvenvs/pynvim/
bin/pip install pynvim

# clone my neovim config
echo '
  _____    __  __  _                           ____     
 / ___/__ / /_/ /_(_)__  ___ _  _______  ___  / _(_)__ _
/ (_ / -_) __/ __/ / _ \/ _ `/ / __/ _ \/ _ \/ _/ / _ `/
\___/\__/\__/\__/_/_//_/\_, /  \__/\___/_//_/_//_/\_, / 
                       /___/                     /___/
'
git clone https://github.com/bab014/nvim-cfg $HOME/.config/nvim

echo "Neovim config cloned over"
echo "Try opening Neovim and running checkhealth"
echo "Might take a minute or two as treesitter needs to install the parsers"
sleep 3
