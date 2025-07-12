#!/bin/bash

source "common.sh"


installDevEnvironment()
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
        "${options[0]}") startCommandGroup "Install Github tool";
                         sudo dnf install gh -y;
                         endCommandGroup "Install Github tool";
                         sleep 3; break;;
        "${options[1]}") startCommandGroup "Install VS Code";
                         sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc;
                         printf "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee -a /etc/yum.repos.d/vscode.repo;
                         sudo dnf install code -y;
                         mkdir -p ~/.config/Code/User/;
                         cp ../Code/settings.json ~/.config/Code/User/settings.json;
                         endCommandGroup "Install VS Code";
                         sleep 3; break;;
        "${options[2]}") startCommandGroup "Install .Net SDK";
                         sudo dnf install dotnet-sdk-8.0 -y;
                         endCommandGroup "Install .Net SDK";
                         sleep 3; break;;
        "${options[3]}") startCommandGroup "Install C++ environment";
                         sudo dnf install gcc gcc-c++ gdb cmake clang autoconf automake -y;
                         endCommandGroup "Install C++ environment";
                         sleep 3; break;;
        "${options[4]}") startCommandGroup "Install Thonny";
                         sudo dnf install thonny -y;
                         sudo usermod -aG dialout $(whoami)
                         endCommandGroup "Install Thonny";
                         sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}
