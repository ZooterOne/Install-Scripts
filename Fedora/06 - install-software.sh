#!/bin/bash

source "00 - common-functions.sh"

startCommandGroup "Install Zen Browser"
flatpak install app.zen_browser.zen
endCommandGroup "Install Zen Browser"

startCommandGroup "Install Bitwarden extension"
firefox https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/
flatpak run app.zen_browser.zen https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/
endCommandGroup "Install Bitwarden extension"

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
