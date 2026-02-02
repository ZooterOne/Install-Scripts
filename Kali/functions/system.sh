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

installWebHackingSoftware()
{
  startCommandGroup "Install web hacking software"
  sudo apt install dirb dirbuster gobuster whois wordlists -y
  sudo apt install proxychains zaproxy wfuzz ffuf -y
  installPostman
  endCommandGroup "Install web hacking software"
}
