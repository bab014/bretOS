#!/bin/bash

sudo apt install curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser
echo '
    ____                           ____           __        ____         __
   / __ )_________ __   _____     /  _/___  _____/ /_____ _/ / /__  ____/ /
  / __  / ___/ __ `/ | / / _ \    / // __ \/ ___/ __/ __ `/ / / _ \/ __  / 
 / /_/ / /  / /_/ /| |/ /  __/  _/ // / / (__  ) /_/ /_/ / / /  __/ /_/ /  
/_____/_/   \__,_/ |___/\___/  /___/_/ /_/____/\__/\__,_/_/_/\___/\__,_/   
                                                                          
'
sleep 3

echo "Need to install chromium for web based Scratchpad"
sudo apt install chromium
