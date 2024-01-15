#!/bin/bash

echo -e "\033[0;36m-- Installing fonts --\e[0m"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/DaddyTimeMono.zip
sudo unzip DaddyTimeMono.zip -d /usr/share/fonts/DaddyTimeMono
rm DaddyTimeMono.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Meslo.zip
sudo unzip Meslo.zip -d /usr/share/fonts/Meslo
rm Meslo.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/VictorMono.zip
sudo unzip VictorMono.zip -d /usr/share/fonts/VictorMono
rm VictorMono.zip

echo -e "\033[0;36m-- Updating font cache --\e[0m"
sudo fc-cache -fv
