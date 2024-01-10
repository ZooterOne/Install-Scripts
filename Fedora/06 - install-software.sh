#!/bin/bash

echo -e "\033[0;36m-- Installing Alacritty --\e[0m"
sudo dnf install alacritty -y
mkdir ~/.config/alacritty
cp ../Alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

echo -e "\033[0;36m-- Installing VSCode --\e[0m"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
printf "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee -a /etc/yum.repos.d/vscode.repo
sudo dnf install code -y
