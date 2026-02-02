#!/bin/bash


setupFlathub()
{
  startCommandGroup "Setup Flathub"
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  endCommandGroup "Setup Flathub"
}

installWarehouse()
{
  startCommandGroup "Install Warehouse"
  flatpak install flathub io.github.flattool.Warehouse -y
  endCommandGroup "Install Warehouse"
}

installFlatseal()
{
  startCommandGroup "Install Flatseal"
  flatpak install flathub com.github.tchx84.Flatseal -y
  endCommandGroup "Install Flatseal"
}

installBazaar()
{
  startCommandGroup "Install Bazaar"
  flatpak install flathub io.github.kolunmi.Bazaar -y
  endCommandGroup "Install Bazaar"
}
