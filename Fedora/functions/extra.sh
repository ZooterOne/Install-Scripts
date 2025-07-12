#!/bin/bash

source "common.sh"


installFlatpakSoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra Flatpak tools installation."
    PS3="Select an option to install: "
    options=("Warehouse." \
      "Flatseal.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") startCommandGroup "Install Warehouse";
                         flatpak install flathub io.github.flattool.Warehouse -y;
                         endCommandGroup "Install Warehouse";
                         sleep 3; break;;
        "${options[1]}") startCommandGroup "Install Flatseal";
                         flatpak install flathub com.github.tchx84.Flatseal -y;
                         endCommandGroup "Install Flatseal";
                         sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

installSystemSoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra system software installation."
    PS3="Select an option to install: "
    options=("Fastfetch." \
      "Btop." \
      "MissionCenter." \
      "Distrobox." \
      "BoxBuddy.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") startCommandGroup "Install Fastfetch";
                         sudo dnf install fastfetch -y;
                         mkdir ~/.config/fastfetch
                         cp ../Fastfetch/config.jsonc ~/.config/fastfetch/
                         cp ../Alacritty/alacritty_fastfetch.toml ~/.config/alacritty/alacritty.toml
                         endCommandGroup "Install Fastfetch";
                         sleep 3; break;;
        "${options[1]}") startCommandGroup "Install Btop";
                         sudo dnf install btop -y;
                         endCommandGroup "Install Btop";
                         sleep 3; break;;
        "${options[2]}") startCommandGroup "Install MissionCenter";
                         flatpak install flathub io.missioncenter.MissionCenter -y;
                         endCommandGroup "Install MissionCenter";
                         sleep 3; break;;
        "${options[3]}") startCommandGroup "Install Distrobox";
                         sudo dnf install distrobox -y;
                         endCommandGroup "Install Distrobox";
                         sleep 3; break;;
        "${options[4]}") startCommandGroup "Install BoxBuddy";
                         flatpak install flathub io.github.dvlv.boxbuddyrs -y;
                         endCommandGroup "Install BoxBuddy";
                         sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

installOfficeSoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra office software installation."
    PS3="Select an option to install: "
    options=("Obsidian.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") startCommandGroup "Install Obsidian";
                         flatpak install flathub md.obsidian.Obsidian -y;
                         endCommandGroup "Install Obsidian";
                         sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

installCreativitySoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra creativity software installation."
    PS3="Select an option to install: "
    options=("Switcheroo." \
      "Pipeline.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") startCommandGroup "Install Switcheroo";
                         flatpak install flathub io.gitlab.adhami3310.Converter -y;
                         endCommandGroup "Install Switcheroo";
                         sleep 3; break;;
        "${options[1]}") startCommandGroup "Install Pipeline";
                         flatpak install flathub de.schmidhuberj.tubefeeder -y;
                         endCommandGroup "Install Pipeline";
                         sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

installExtraSoftware()
{
 while true; do
    clear
    echo -e "\e[35mFedora post-installation scripts.\e[0m"
    echo -e "Extra software installation."
    PS3="Select an option to install: "
    options=("Flatpak tools." \
      "System software." \
      "Office software." \
      "Creativity software.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") installFlatpakSoftware; sleep 3; break;;
        "${options[1]}") installSystemSoftware; sleep 3; break;;
        "${options[2]}") installOfficeSoftware; sleep 3; break;;
        "${options[3]}") installCreativitySoftware; sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}
