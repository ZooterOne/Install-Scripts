#!/bin/bash

echo -e "\033[0;36m-- Installing Gnome add-ons --\e[0m"
sudo dnf install gnome-extensions-app gnome-tweaks pop-icon-theme -y

echo -e "\033[0;36m-- Installing Gnome extensions --\e[0m"
sudo dnf install gnome-shell-extension-pop-shell gnome-shell-extension-apps-menu gnome-shell-extension-blur-my-shell -y

echo -e "\033[0;36m-- Setting up Gnome interface --\e[0m"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Pop'
gsettings set org.gnome.desktop.interface icon-theme 'Pop'
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

echo -e "\033[0;36m-- Setting up Gnome font --\e[0m"
gsettings set org.gnome.desktop.interface document-font-name 'DaddyTimeMono Nerd Font 11'
gsettings set org.gnome.desktop.interface font-name 'DaddyTimeMono Nerd Font 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'MesloLGS Nerd Font 10'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'DaddyTimeMono Nerd Font Bold 11'

echo -e "\033[0;36m-- Setting up Gnome extensions --\e[0m"
gsettings set org.gnome.shell enabled-extensions "['apps-menu@gnome-shell-extensions.gcampax.github.com', 'background-logo@fedorahosted.org', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'pop-shell@system76.com', 'blur-my-shell@aunetx']"
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'Alacritty.desktop', 'code.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop']"
gsettings set org.fedorahosted.background-logo-extension logo-always-visible true
gsettings set org.fedorahosted.background-logo-extension logo-border 7
gsettings set org.fedorahosted.background-logo-extension logo-opacity 47
gsettings set org.fedorahosted.background-logo-extension logo-position 'bottom-right'
gsettings set org.fedorahosted.background-logo-extension logo-size 6.096
