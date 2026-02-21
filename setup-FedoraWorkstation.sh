#!/bin/bash

source "./Common/common.sh"
source "./Common/fonts.sh"
source "./Common/shell.sh"
source "./Common/software.sh"
source "./Flathub/system.sh"
source "./Flathub/software.sh"

source "./Fedora/common.sh"
source "./Fedora/system.sh"
source "./Fedora/drivers.sh"
source "./Fedora/shell.sh"
source "./Fedora/software.sh"
source "./Fedora/gnome.sh"


#####################################################################
# Menus
#####################################################################

showDrivers()
{
  while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra drivers installation."
    PS3="Select an option to install: "
    options=("NVidia driver." \
      "Macbook Air Wifi.")
    select option in "${options[@]}" "Back."; do
      case "$option" in
        "${options[0]}") installNVidiaDriver; sleep 3; break;;
        "${options[1]}") installBroadcomDriver; sleep 3; break;;
        "Back.") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

showDevSoftware()
{
  while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Dev environment installation."
    PS3="Select an option to install: "
    options=("Github tool." \
      "LazyGit." \
      "VS Code." \
      ".Net SDK." \
      "C++ tools." \
      "Raspberry PI tools." \
      "Dev Toolbox.")
    select option in "${options[@]}" "Back."; do
      case "$option" in
        "${options[0]}") installGithubTool; sleep 3; break;;
        "${options[1]}") installLazyGit; sleep 3; break;;
        "${options[2]}") installVSCode; sleep 3; break;;
        "${options[3]}") installDotNetSdk; sleep 3; break;;
        "${options[4]}") installCppSDK; sleep 3; break;;
        "${options[5]}") installThonny; sleep 3; break;;
        "${options[6]}") installDevToolbox; sleep 3; break;;
        "Back.") return;;
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
    echo -e "Flatpak tools installation."
    PS3="Select an option to install: "
    options=("Warehouse." \
      "Flatseal." \
      "Bazaar.")
    select option in "${options[@]}" "Back."; do
      case "$option" in
        "${options[0]}") installWarehouse; sleep 3; break;;
        "${options[1]}") installFlatseal; sleep 3; break;;
        "${options[2]}") installBazaar; sleep 3; break;;
        "Back.") return;;
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
    echo -e "System software installation."
    PS3="Select an option to install: "
    options=("Fastfetch." \
      "Grub theme." \
      "Btop." \
      "MissionCenter.")
    select option in "${options[@]}" "Back."; do
      case "$option" in
        "${options[0]}") installFastfetch;
                         setupFastfetch;
                         setupAlacrittyFastfetch;
                         sleep 3; break;;
        "${options[1]}") setupGrub; sleep 3; break;;
        "${options[2]}") installBtop; sleep 3; break;;
        "${options[3]}") installMissionCenter; sleep 3; break;;
        "Back.") return;;
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
    echo -e "Network software installation."
    PS3="Select an option to install: "
    options=("Nmap." \
      "Iftop." \
      "Proton VPN." \
      "Transmission.")
    select option in "${options[@]}" "Back."; do
      case "$option" in
        "${options[0]}") installNmap; sleep 3; break;;
        "${options[1]}") installIftop; sleep 3; break;;
        "${options[2]}") installProtonVPNDesktop; sleep 3; break;;
        "${options[3]}") installTransmissionDesktop; sleep 3; break;;
        "Back.") return;;
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
    echo -e "Office software installation."
    PS3="Select an option to install: "
    options=("Obsidian." \
      "Apostrophe.")
    select option in "${options[@]}" "Back."; do
      case "$option" in
        "${options[0]}") installObsidian; sleep 3; break;;
        "${options[1]}") installApostrophe; sleep 3; break;;
        "Back.") return;;
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
    echo -e "Creativity software installation."
    PS3="Select an option to install: "
    options=("Gimp." \
      "Kdenlive." \
      "Audacity." \
      "Switcheroo." \
      "Pipeline.")
    select option in "${options[@]}" "Back."; do
      case "$option" in
        "${options[0]}") installGimp; sleep 3; break;;
        "${options[1]}") installKdenlive; sleep 3; break;;
        "${options[2]}") installAudacity; sleep 3; break;;
        "${options[3]}") installSwitcheroo; sleep 3; break;;
        "${options[4]}") installPipeline; sleep 3; break;;
        "Back.") return;;
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
    echo -e "Virtualization software installation."
    PS3="Select an option to install: "
    options=("Virtualbox." \
      "Distrobox." \
      "BoxBuddy.")
    select option in "${options[@]}" "Back."; do
      case "$option" in
        "${options[0]}") installVirtualBox; sleep 3; break;;
        "${options[1]}") installDistrobox; sleep 3; break;;
        "${options[2]}") installBoxBuddy; sleep 3; break;;
        "Back.") return;;
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
    echo -e "AI software installation."
    PS3="Select an option to install: "
    options=("Ollama." \
      "Gpt-Oss Model." \
      "Devstral Model.")
    select option in "${options[@]}" "Back."; do
      case "$option" in
        "${options[0]}") installOllama; sleep 3; break;;
        "${options[1]}") installOllamaGptModel; sleep 3; break;;
        "${options[2]}") installOllamaDevstralModel; sleep 3; break;;
        "Back.") return;;
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
      "Development software." \
      "Virtualization software." \
      "AI software.")
    select option in "${options[@]}" "Back."; do
      case "$option" in
        "${options[0]}") showFlatpakSoftware; sleep 3; break;;
        "${options[1]}") showSystemSoftware; sleep 3; break;;
        "${options[2]}") showNetworkSoftware; sleep 3; break;;
        "${options[3]}") showOfficeSoftware; sleep 3; break;;
        "${options[4]}") showCreativitySoftware; sleep 3; break;;
        "${options[5]}") showDevSoftware; sleep 3; break;;
        "${options[6]}") showVirtualizationSoftware; sleep 3; break;;
        "${options[7]}") showAISoftware; sleep 3; break;;
        "Back.") return;;
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
    "Install extra drivers." \
    "Install extra software." \
    "Update system and apps.")
  select option in "${options[@]}" "Quit."; do
    case "$option" in
      "${options[0]}") setupHostname;
                       updateDnfOptions;
                       setupRpmFusion;
                       setupFlathub;
                       updateSystem;
                       installDaddyTimeFonts;
                       installHurmitFonts;
                       refreshFontCache;
                       installFish;
                       installStarship;
                       setupStarship;
                       setupStarshipFish;
                       installAlacritty;
                       setupAlacritty;
                       installEza;
                       setupEza;
                       setupEzaFishAlias;
                       setupFirefox;
                       installHEIC;
                       installVLC;
                       configureGnome;
                       sleep 3; break;;
      "${options[1]}") showDrivers; sleep 3; break;;
      "${options[2]}") showExtraSoftware; break;;
      "${options[3]}") updateSystem; updateApps; break;;
      "Quit.") exit;;
      *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid option.\e[0m";
    esac
  done
done
