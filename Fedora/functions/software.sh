#!/bin/bash

source "common.sh"


installSoftware()
{
  startCommandGroup "Install LibreWolf"
  flatpak install flathub io.gitlab.librewolf-community -y
  cp ../LibreWolf/librewolf.overrides.cfg ~/.var/app/io.gitlab.librewolf-community/.librewolf/
  flatpak run io.gitlab.librewolf-community about:preferences
  endCommandGroup "Install LibreWolf"

  startCommandGroup "Install Bitwarden extension"
  flatpak run io.gitlab.librewolf-community https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/
  endCommandGroup "Install Bitwarden extension"

  startCommandGroup "Install HEIC support"
  sudo dnf install heif-pixbuf-loader libheif-freeworld libheif-tools -y
  endCommandGroup "Install HEIC support"

  startCommandGroup "Install VLC"
  sudo dnf install intel-media-driver -y
  sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
  sudo dnf install vlc -y
  endCommandGroup "Install VLC"
}
