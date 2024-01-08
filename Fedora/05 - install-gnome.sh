#!/bin/bash

echo -e "\033[0;36m-- Installing Gnome add-ons --\e[0m"
sudo dnf install gnome-extensions-app gnome-tweaks pop-icon-theme -y

echo -e "\033[0;36m-- Installing Gnome extensions --\e[0m"
sudo dnf install gnome-shell-extension-pop-shell gnome-shell-extension-apps-menu gnome-shell-extension-blur-my-shell -y

echo -e "\033[0;31m-- Manual steps required --\e[0m"
echo " --> Setup Gnome Tweaks."
echo " --> Setup Gnome Settings."
echo " --> Setup Gnome Extensions."
