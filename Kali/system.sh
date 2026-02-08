#!/bin/bash


updateSystem()
{
  startCommandGroup "Update system"
  sudo apt update && apt full-upgrade -y
  endCommandGroup "Update system"
}

installDefaultSoftware()
{
  startCommandGroup "Install default software"
  sudo apt install kali-system-cli kali-linux-core kali-tools-top10 kali-tweaks -y
  endCommandGroup "Install default software"
}

installEza()
{
  startCommandGroup "Install Eza"
  sudo apt install eza -y
  endCommandGroup "Install Eza"
}
