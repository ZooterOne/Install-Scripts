#!/bin/bash

source "common.sh"


installSoftware()
{
  startCommandGroup "Setup Firefox"
  firefox https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/
  firefox https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/
  firefox about:preferences
  endCommandGroup "Setup Firefox"

  startCommandGroup "Install HEIC support"
  sudo dnf install heif-pixbuf-loader libheif-freeworld libheif-tools -y
  endCommandGroup "Install HEIC support"

  startCommandGroup "Install VLC"
  sudo dnf install intel-media-driver -y
  sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
  sudo dnf install vlc -y
  endCommandGroup "Install VLC"
}
