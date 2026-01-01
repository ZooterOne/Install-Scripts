#!/bin/bash

source "functions/common.sh"
source "functions/system.sh"
source "functions/shell.sh"
source "functions/software.sh"


#####################################################################
# Menus
#####################################################################

showExtraSoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra software installation."
    PS3="Select an option to install: "
    options=("Fastfetch." \
      "Btop." \
      "Proton VPN." \
      "Nmap." \
      "Transmission." \
      "Distrobox." \
      "Ollama.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") installFastfetch;
                         setupFastfetchNoIcons;
                         setupFishFastfetch;
                         sleep 3; break;;
        "${options[1]}") installBtop; sleep 3; break;;
        "${options[2]}") installProtonVPNCli; sleep 3; break;;
        "${options[3]}") installNmap; sleep 3; break;;
        "${options[4]}") installTransmissionCli; sleep 3; break;;
        "${options[5]}") installDistrobox; sleep 3; break;;
        "${options[6]}") installOllama; installOllamaGptModel; sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

#####################################################################
# Main loop
#####################################################################

while true; do
  clear
  echo -e "\e[35mFedora post-installation scripts.\e[0m"
  echo
  PS3="Select an option to run: "
  options=("System setup." \
    "Setup shell." \
    "Install extra software.")
  select option in "${options[@]}" "Quit"; do
    case "$option" in
      "${options[0]}") setupHostname;
                       updateDnfOptions;
                       setupRpmFusion;
                       updateSystem;
                       setupAutoUpdates;
                       sleep 3; break;;
      "${options[1]}") installFish;
                       installFishTide;
                       setupFishAsDefaultShell;
                       installEza;
                       setupEzaAliasNoIcons;
                       sleep 3; break;;
      "${options[2]}") showExtraSoftware; break;;
      "Quit") exit;;
      *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid option.\e[0m";
    esac
  done
done
