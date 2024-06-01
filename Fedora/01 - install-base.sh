#!/bin/bash

source "00 - common-functions.sh"

if [ $# -eq 1 ]
  then
    startCommandGroup "Set hostname"
    sudo hostnamectl set-hostname $1
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

startCommandGroup "Update system"
sudo dnf upgrade -y --refresh
endCommandGroup "Update system"
