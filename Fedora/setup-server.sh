#!/bin/bash

source "../Common/common.sh"
source "../Common/shell.sh"
source "../Common/software.sh"

source "functions/system.sh"
source "functions/shell.sh"
source "functions/software.sh"


while true; do
  clear
  echo -e "\e[35mFedora post-installation scripts.\e[0m"
  echo
  PS3="Select an option to run: "
  options=("System setup." \
    "Setup Fish shell.")
  select option in "${options[@]}" "Quit."; do
    case "$option" in
      "${options[0]}") setupHostname;
                       updateDnfOptions;
                       setupRpmFusion;
                       updateSystem;
                       setupAutoUpdates;
                       installEza;
                       setupEza;
                       setupEzaBashAliasNoIcons;
                       installFastfetch;
                       setupFastfetchNoIcons;
                       setupBashFastfetch
                       installBtop;
                       sleep 3; break;;
      "${options[1]}") installFish;
                       installFishTide;
                       setupFishAsDefaultShell;
                       setupEzaFishAliasNoIcons;
                       setupFishFastfetch;
                       sleep 3; break;;
      "Quit.") exit;;
      *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid option.\e[0m";
    esac
  done
done
