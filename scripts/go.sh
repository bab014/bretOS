#!/bin/bash

DOWNLOAD_DIR="$HOME/Downloads"

# downloads and install go
wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz -O "$DOWNLOAD_DIR/go.tar.gz"

# extract the tar file to /usr/local
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "$DOWNLOAD_DIR/go.tar.gz"
