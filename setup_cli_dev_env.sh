#!/bin/sh

# now install .zsh first
sudo apt-get update
sudo apt-get install -y zsh

# now we install oh-my-zsh (curl is pre-installed) 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
