#!/bin/bash

source "00 - common-functions.sh"

startCommandGroup "Install Bitwarden Firefox extension"
wget https://addons.mozilla.org/firefox/downloads/file/4282854/bitwarden_password_manager-2024.4.2.xpi
firefox bitwarden_password_manager-2024.4.2.xpi
rm bitwarden_password_manager-2024.4.2.xpi
endCommandGroup "Install Bitwarden Firefox extension"

startCommandGroup "Install HEIC support"
sudo dnf install heif-pixbuf-loader libheif-freeworld -y
endCommandGroup "Install HEIC support"

startCommandGroup "Install VLC"
sudo dnf install intel-media-driver -y
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf install vlc -y
endCommandGroup "Install VLC"

startCommandGroup "Install Alacritty"
sudo dnf install alacritty -y
mkdir ~/.config/alacritty
cp ../Alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
endCommandGroup "Install Alacritty"
