#!/bin/bash

source "common.sh"


systemSetup()
{
  read -p "Enter the computer name: " name;
  if [ ! -z "$name" ]; then
    startCommandGroup "Set hostname"
    sudo hostnamectl set-hostname "$name"
    endCommandGroup "Set hostname"
  fi

  startCommandGroup "Set dnf options"
  echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
  echo "countme=false" | sudo tee -a /etc/dnf/dnf.conf
  endCommandGroup "Set dnf options"

  startCommandGroup "Set rpmfusion"
  sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y --nogpgcheck
  sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y --nogpgcheck
  endCommandGroup "Set rpmfusion"

  startCommandGroup "Setup Flathub"
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  endCommandGroup "Setup Flathub"

  startCommandGroup "Update system"
  sudo dnf upgrade -y --refresh
  endCommandGroup "Update system"
}
