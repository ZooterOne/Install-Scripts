#!/bin/bash


installWebHackingSoftware()
{
  startCommandGroup "Install web hacking software"
  sudo apt install dirb dirbuster gobuster whois wordlists -y
  sudo apt install proxychains zaproxy wfuzz ffuf -y
  sudo apt install amass nikto arjun -y
  installPostman
  endCommandGroup "Install web hacking software"
}
