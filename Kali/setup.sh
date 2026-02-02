#!/bin/bash

source "../Common/common.sh"
source "../Common/shell.sh"
source "../Common/software.sh"

source "functions/system.sh"


while true; do
  clear
  echo -e "\e[35mKali post-installation scripts.\e[0m"
  echo
  PS3="Select an option to run: "
  options=("System setup." \
    "Install web hacking software.")
  select option in "${options[@]}" "Quit."; do
    case "$option" in
      "${options[0]}") updateSystem;
                       installDefaultSoftware;
                       sleep 3; break;;
      "${options[1]}") installWebHackingSoftware; sleep 3; break;;
      "Quit.") exit;;
      *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid option.\e[0m";
    esac
  done
done
