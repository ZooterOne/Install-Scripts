#!/bin/bash


installNVidia()
{
  startCommandGroup "Enable nvidia drivers repository"
  sudo dnf install fedora-workstation-repositories -y
  sudo dnf config-manager --set-enable rpmfusion-nonfree-nvidia-driver
  endCommandGroup "Enable nvidia drivers repository"

  startCommandGroup "Install kernel headers and makefiles"
  sudo dnf install kernel-devel -y
  endCommandGroup "Install kernel headers and makefiles"

  startCommandGroup "Install drivers"
  sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y
  endCommandGroup "Install drivers"
}
