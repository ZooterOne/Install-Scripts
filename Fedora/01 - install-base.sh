#!/bin/bash

if [ $# -eq 1 ]
  then
    echo -e "\033[0;36m-- Setting hostname --\e[0m"
    sudo hostnamectl set-hostname $1
fi

echo -e "\033[0;36m-- Setting dnf options --\e[0m"
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo "fastestmirror=true" | sudo tee -a /etc/dnf/dnf.conf
echo "deltarpm=true" | sudo tee -a /etc/dnf/dnf.conf

echo -e "\033[0;36m-- Installing updates --\e[0m"
sudo dnf upgrade -y

echo -e "\033[0;36m-- Setting rpmfusion --\e[0m"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y --nogpgcheck
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y --nogpgcheck
sudo dnf group update core -y
