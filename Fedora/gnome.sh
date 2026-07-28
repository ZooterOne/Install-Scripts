#!/bin/bash


installGnomeExtensions()
{
  startCommandGroup "Install Gnome add-ons"
  sudo dnf install gnome-extensions-app gnome-tweaks breeze-cursor-theme papirus-icon-theme-dark adw-gtk3-theme -y
  endCommandGroup "Install Gnome add-ons"

  startCommandGroup "Install Gnome extensions"
  sudo dnf install gnome-shell-extension-appindicator gnome-shell-extension-pop-shell gnome-shell-extension-blur-my-shell -y
  endCommandGroup "Install Gnome extensions"
}
