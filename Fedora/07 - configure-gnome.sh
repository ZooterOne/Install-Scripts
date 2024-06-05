#!/bin/bash

source "00 - common-functions.sh"

startCommandGroup "Install Gnome add-ons"
sudo dnf install gnome-extensions-app gnome-tweaks pop-icon-theme -y
endCommandGroup "Install Gnome add-ons"

startCommandGroup "Install Gnome extensions"
sudo dnf install gnome-shell-extension-pop-shell gnome-shell-extension-apps-menu gnome-shell-extension-blur-my-shell -y
endCommandGroup "Install Gnome extensions"

startCommandGroup "Setup Gnome interface"
gsettings set org.gnome.desktop.interface clock-format '24h'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Pop'
gsettings set org.gnome.desktop.interface icon-theme 'Pop'
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
endCommandGroup "Setup Gnome interface"

startCommandGroup "Setup Gnome fonts"
gsettings set org.gnome.desktop.interface document-font-name 'DaddyTimeMono Nerd Font 11'
gsettings set org.gnome.desktop.interface font-name 'DaddyTimeMono Nerd Font 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'MesloLGS Nerd Font 10'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'DaddyTimeMono Nerd Font Bold 11'
endCommandGroup "Setup Gnome fonts"

startCommandGroup "Setup Gnome privacy"
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true
gsettings set org.gnome.desktop.privacy old-files-age "30"
gsettings set org.gnome.desktop.privacy report-technical-problems false
gsettings set org.gnome.desktop.privacy send-software-usage-stats false
endCommandGroup "Setup Gnome privacy"

startCommandGroup "Setup Gnome Touchpad"
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
endCommandGroup "Setup Gnome Touchpad"

startCommandGroup "Setup Gnome extensions"
gsettings set org.gnome.shell enabled-extensions "['apps-menu@gnome-shell-extensions.gcampax.github.com', 'background-logo@fedorahosted.org', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'pop-shell@system76.com', 'blur-my-shell@aunetx']"
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'Alacritty.desktop', 'code.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop']"
gsettings set org.fedorahosted.background-logo-extension logo-always-visible true
gsettings set org.fedorahosted.background-logo-extension logo-border 7
gsettings set org.fedorahosted.background-logo-extension logo-opacity 47
gsettings set org.fedorahosted.background-logo-extension logo-position 'bottom-right'
gsettings set org.fedorahosted.background-logo-extension logo-size 6.096
endCommandGroup "Setup Gnome extensions"
