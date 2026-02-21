#!/bin/bash


setupHostname()
{
  read -p "Enter the computer name: " name;
  if [ ! -z "$name" ]; then
    startCommandGroup "Set hostname"
    sudo hostnamectl set-hostname "$name"
    endCommandGroup "Set hostname"
  fi
}

updateDnfOptions()
{
  startCommandGroup "Update dnf options"
  echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
  echo "countme=false" | sudo tee -a /etc/dnf/dnf.conf
  endCommandGroup "Update dnf options"
}

setupRpmFusion()
{
  startCommandGroup "Setup rpmfusion"
  sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y --nogpgcheck
  sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y --nogpgcheck
  endCommandGroup "Setup rpmfusion"
}

updateSystem()
{
  startCommandGroup "Update system"
  sudo dnf upgrade -y --refresh
  endCommandGroup "Update system"
}

updateApps()
{
  startCommandGroup "Update apps"
  flatpak update -y
  endCommandGroup "Update apps"
}

setupAutoUpdates()
{
  startCommandGroup "Setup auto-updates"
  sudo dnf install dnf-automatic -y
  echo -e "[commands]\napply_updates=True\nreboot=when-needed" | sudo tee -a /etc/dnf/automatic.conf
  sudo systemctl enable --now dnf-automatic.timer
  endCommandGroup "Setup auto-updates"
}

setupGrub()
{
  startCommandGroup "Setup Grub"
  git clone https://github.com/AdisonCavani/distro-grub-themes ~/Downloads/Grub
  sudo mkdir -p /boot/grub2/themes/fedora
  sudo tar -C /boot/grub2/themes/fedora -xf ~/Downloads/Grub/themes/fedora.tar
  rm -rf ~/Downloads/Grub
  sudo cp ./Grub/grub-fedora /etc/default/grub
  sudo grub2-mkconfig -o /boot/grub2/grub.cfg
  endCommandGroup "Setup Grub"
}
