#!/bin/bash

source "00 - common-functions.sh"

startCommandGroup "Install VLC"
sudo dnf install vlc -y
sudo dnf install ffmpeg libavcodec-freeworld --allowerasing -y
endCommandGroup "Install VLC"

startCommandGroup "Install Alacritty"
sudo dnf install alacritty -y
mkdir ~/.config/alacritty
cp ../Alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
endCommandGroup "Install Alacritty"

startCommandGroup "Install VSCode"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
printf "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee -a /etc/yum.repos.d/vscode.repo
sudo dnf install code -y
endCommandGroup "Install VSCode"
