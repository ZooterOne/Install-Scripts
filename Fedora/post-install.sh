#!/bin/bash

source "functions/common.sh"
source "functions/system.sh"
source "functions/nvidia.sh"
source "functions/fonts.sh"
source "functions/terminal.sh"
source "functions/software.sh"
source "functions/gnome.sh"
source "functions/dev.sh"
source "functions/extra.sh"


while true; do
  clear
  echo -e "\e[35mFedora post-installation scripts.\e[0m"
  echo
  PS3="Select an option to run: "
  options=("System setup." \
    "Install NVidia drivers." \
    "Install fonts." \
    "Setup Terminal." \
    "Install base software." \
    "Configure Gnome." \
    "Install dev environment." \
    "Install extra software.")
  select option in "${options[@]}" "Quit"; do
    case "$option" in
      "${options[0]}") systemSetup; sleep 3; break;;
      "${options[1]}") installNVidia; sleep 3; break;;
      "${options[2]}") installFonts; sleep 3; break;;
      "${options[3]}") setupTerminal; sleep 3; break;;
      "${options[4]}") installSoftware; sleep 3; break;;
      "${options[5]}") configureGnome; sleep 3; break;;
      "${options[6]}") installDevEnvironment; break;;
      "${options[7]}") installExtraSoftware; break;;
      "Quit") exit;;
      *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid option.\e[0m";
    esac
  done
done
