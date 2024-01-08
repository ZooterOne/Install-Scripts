#!/bin/bash

echo -e "\033[0;36m-- Installing Alacritty --\e[0m"
sudo dnf install alacritty -y
mkdir ~/.config/alacritty
cp ../Alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
