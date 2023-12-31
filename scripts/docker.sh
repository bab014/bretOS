#     ____             __           
#    / __ \____  _____/ /_____  _____
#   / / / / __ \/ ___/ //_/ _ \/ ___/
#  / /_/ / /_/ / /__/ ,< /  __/ / 
# /_____/\____/\___/_/|_|\___/_/
#
#!/bin/bash

# installing docker

# removing packages for safety
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# create docker group and add user
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Docker installed and running, you must reboot in order to see the changes"
echo '
    ____             __                ____           __        ____         __
   / __ \____  _____/ /_____  _____   /  _/___  _____/ /_____ _/ / /__  ____/ /
  / / / / __ \/ ___/ //_/ _ \/ ___/   / // __ \/ ___/ __/ __ `/ / / _ \/ __  / 
 / /_/ / /_/ / /__/ ,< /  __/ /     _/ // / / (__  ) /_/ /_/ / / /  __/ /_/ /  
/_____/\____/\___/_/|_|\___/_/     /___/_/ /_/____/\__/\__,_/_/_/\___/\__,_/   

'
sleep 3
