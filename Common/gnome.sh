#!/bin/bash


configureGnome()
{
  startCommandGroup "Setup Gnome interface"
  gsettings set org.gnome.desktop.interface clock-format '24h'
  gsettings set org.gnome.desktop.interface show-battery-percentage true
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
  gsettings set org.gnome.desktop.interface cursor-theme 'breeze_cursors'
  gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
  gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
  endCommandGroup "Setup Gnome interface"

  startCommandGroup "Setup Gnome wallpaper"
  sudo cp ./Wallpaper/Antibes-Port-Olivette.jxl /usr/share/backgrounds/
  gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/share/backgrounds/Antibes-Port-Olivette.jxl'
  endCommandGroup "Setup Gnome wallpaper"

  startCommandGroup "Setup Gnome fonts"
  gsettings set org.gnome.desktop.interface document-font-name 'Agave Nerd Font Propo 12'
  gsettings set org.gnome.desktop.interface font-name 'Agave Nerd Font Propo 12'
  gsettings set org.gnome.desktop.interface monospace-font-name 'Agave Nerd Font Mono 12'
  gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Agave Nerd Font Bold 12'
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
  gsettings set org.gnome.shell enabled-extensions "['background-logo@fedorahosted.org', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'appindicatorsupport@rgcjonas.gmail.com', 'pop-shell@system76.com', 'blur-my-shell@aunetx']"
  gsettings set org.gnome.shell favorite-apps "['org.mozilla.firefox.desktop', 'Alacritty.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop']"
  gsettings set org.fedorahosted.background-logo-extension logo-always-visible true
  gsettings set org.fedorahosted.background-logo-extension logo-border 7
  gsettings set org.fedorahosted.background-logo-extension logo-opacity 255
  gsettings set org.fedorahosted.background-logo-extension logo-position 'bottom-right'
  gsettings set org.fedorahosted.background-logo-extension logo-size 6.096
  endCommandGroup "Setup Gnome extensions"

  startCommandGroup "Setup Gnome default apps"
  gnome-control-center applications
  endCommandGroup "Setup Gnome default apps"
}
