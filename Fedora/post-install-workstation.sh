#!/bin/bash

source "functions/common.sh"
source "functions/system.sh"
source "functions/nvidia.sh"
source "functions/fonts.sh"
source "functions/terminal.sh"
source "functions/software.sh"
source "functions/gnome.sh"
source "functions/dev.sh"


#####################################################################
# Menus
#####################################################################

showDevEnvironment()
{
  while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Dev environment installation."
    PS3="Select an option to install: "
    options=("Github tool." \
      "VS Code." \
      ".Net SDK." \
      "C++ tools." \
      "Raspberry PI tools.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") installGithubTool; sleep 3; break;;
        "${options[1]}") installVSCode; sleep 3; break;;
        "${options[2]}") installDotNetSdk; sleep 3; break;;
        "${options[3]}") installCppSDK; sleep 3; break;;
        "${options[4]}") installThonny; sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

showFlatpakSoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra Flatpak tools installation."
    PS3="Select an option to install: "
    options=("Warehouse." \
      "Flatseal." \
      "Bazaar.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") installWarehouse; sleep 3; break;;
        "${options[1]}") installFlatseal; sleep 3; break;;
        "${options[2]}") installBazaar; sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

showSystemSoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra system software installation."
    PS3="Select an option to install: "
    options=("Fastfetch." \
      "Btop." \
      "MissionCenter." \
      "Macbook Air Wifi.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") installFastfetch; setupAlacrittyFastfetch; sleep 3; break;;
        "${options[1]}") installBtop; sleep 3; break;;
        "${options[2]}") installMissionCenter; sleep 3; break;;
        "${options[3]}") installBroadcomDriver; sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

showNetworkSoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra network software installation."
    PS3="Select an option to install: "
    options=("Nmap." \
      "Proton VPN.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") installNmap; sleep 3; break;;
        "${options[1]}") installProtonVPNDesktop; sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

showOfficeSoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra office software installation."
    PS3="Select an option to install: "
    options=("Obsidian." \
      "Apostrophe")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") installObsidian; sleep 3; break;;
        "${options[1]}") installApostrophe; sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

showCreativitySoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra creativity software installation."
    PS3="Select an option to install: "
    options=("Gimp." \
      "Kdenlive." \
      "Audacity." \
      "Switcheroo." \
      "Pipeline.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") installGimp; sleep 3; break;;
        "${options[1]}") installKdenlive; sleep 3; break;;
        "${options[2]}") installAudacity; sleep 3; break;;
        "${options[3]}") installSwitcheroo; sleep 3; break;;
        "${options[4]}") installPipeline; sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

showVirtualizationSoftware()
{
  while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra virtualization software installation."
    PS3="Select an option to install: "
    options=("Virtualbox." \
      "Distrobox." \
      "BoxBuddy.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") installVirtualBox; sleep 3; break;;
        "${options[1]}") installDistrobox; sleep 3; break;;
        "${options[2]}") installBoxBuddy; sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

showAISoftware()
{
  while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra AI software installation."
    PS3="Select an option to install: "
    options=("Ollama." \
      "Gpt-Oss Model.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") installOllama; sleep 3; break;;
        "${options[1]}") installOllamaGptModel; sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

showExtraSoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra software installation."
    PS3="Select an option to install: "
    options=("Flatpak tools." \
      "System software." \
      "Network software." \
      "Office software." \
      "Creativity software." \
      "Virtualization software." \
      "AI software.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") showFlatpakSoftware; sleep 3; break;;
        "${options[1]}") showSystemSoftware; sleep 3; break;;
        "${options[2]}") showNetworkSoftware; sleep 3; break;;
        "${options[3]}") showOfficeSoftware; sleep 3; break;;
        "${options[4]}") showCreativitySoftware; sleep 3; break;;
        "${options[5]}") showVirtualizationSoftware; sleep 3; break;;
        "${options[6]}") showAISoftware; sleep 3; break;;
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
    "Install NVidia drivers." \
    "Install fonts." \
    "Setup Terminal." \
    "Install base software." \
    "Configure Gnome." \
    "Install dev environment." \
    "Install extra software.")
  select option in "${options[@]}" "Quit"; do
    case "$option" in
      "${options[0]}") setupHostname;
                       updateDnfOptions;
                       setupRpmFusion;
                       setupFlathub;
                       updateSystem;
                       sleep 3; break;;
      "${options[1]}") installNVidia; sleep 3; break;;
      "${options[2]}") installDaddyTimeFonts;
                       installHurmitFonts;
                       refreshFontCache;
                       sleep 3; break;;
      "${options[3]}") installFish;
                       installStarship;
                       installAlacritty;
                       installEza;
                       sleep 3; break;;
      "${options[4]}") setupFirefox;
                       installHEIC;
                       installVLC;
                       sleep 3; break;;
      "${options[5]}") configureGnome; sleep 3; break;;
      "${options[6]}") showDevEnvironment; break;;
      "${options[7]}") showExtraSoftware; break;;
      "Quit") exit;;
      *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid option.\e[0m";
    esac
  done
done
