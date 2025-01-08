#! /bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install stow -y
stow 

sudo pacman -Syu --noconfirm                         #Full System Update.
sudo pacman -S git neovim github-desktop --noconfirm #Instal Bare Min Packages Required for setup.
