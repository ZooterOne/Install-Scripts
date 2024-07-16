#!/bin/bash

source "00 - common-functions.sh"

startCommandGroup "Install DaddyTime fonts"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DaddyTimeMono.zip
sudo unzip DaddyTimeMono.zip -d /usr/share/fonts/DaddyTimeMono
rm DaddyTimeMono.zip
endCommandGroup "Install DaddyTime fonts"

startCommandGroup "Install Hurmit fonts"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hermit.zip
sudo unzip Hermit.zip -d /usr/share/fonts/Hurmit
rm Hermit.zip
endCommandGroup "Install Hurmit fonts"

startCommandGroup "Install font cache"
sudo fc-cache -fv
endCommandGroup "Install font cache"
