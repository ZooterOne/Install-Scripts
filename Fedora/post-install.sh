#!/bin/bash

startCommandGroup()
{
  echo -e "\e[36m[----] $1.\e[0m"
}

endCommandGroup()
{
  if [[ $? -eq 0 ]]; then
    echo -e "\e[36m[\e[32m OK \e[36m] $1.\e[0m"
  else
    echo -e "\e[36m[\e[31mFAIL\e[36m] $1.\e[0m"
  fi
}

systemSetup()
{
  read -p "Enter the computer name: " name;
  if [ ! -z "$name" ]; then
    startCommandGroup "Set hostname"
    sudo hostnamectl set-hostname "$name"
    endCommandGroup "Set hostname"
  fi

  startCommandGroup "Set dnf options"
  echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
  echo "countme=false" | sudo tee -a /etc/dnf/dnf.conf
  endCommandGroup "Set dnf options"

  startCommandGroup "Set rpmfusion"
  sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y --nogpgcheck
  sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y --nogpgcheck
  endCommandGroup "Set rpmfusion"

  startCommandGroup "Setup Flathub"
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  endCommandGroup "Setup Flathub"

  startCommandGroup "Update system"
  sudo dnf upgrade -y --refresh
  endCommandGroup "Update system"
}

installNVidia()
{
  startCommandGroup "Enable nvidia drivers repository"
  sudo dnf install fedora-workstation-repositories -y
  sudo dnf config-manager --set-enable rpmfusion-nonfree-nvidia-driver
  endCommandGroup "Enable nvidia drivers repository"

  startCommandGroup "Install kernel headers and makefiles"
  sudo dnf install kernel-devel -y
  endCommandGroup "Install kernel headers and makefiles"

  startCommandGroup "Install drivers"
  sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y
  endCommandGroup "Install drivers"
}

installFonts()
{
  startCommandGroup "Install DaddyTime fonts"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DaddyTimeMono.zip
  sudo unzip DaddyTimeMono.zip -d /usr/share/fonts/DaddyTimeMono
  rm DaddyTimeMono.zip
  endCommandGroup "Install DaddyTime fonts"

  startCommandGroup "Install Hurmit fonts"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hermit.zip
  sudo unzip Hermit.zip -d /usr/share/fonts/Hurmit
  rm Hermit.zip
  endCommandGroup "Install Hurmit fonts"

  startCommandGroup "Install font cache"
  sudo fc-cache -fv
  endCommandGroup "Install font cache"
}

installFish()
{
  startCommandGroup "Install fish"
  sudo dnf install util-linux-user fish -y
  endCommandGroup "Install fish"

  startCommandGroup "Install eza"
  wget https://github.com/eza-community/eza/releases/download/v0.21.3/eza_x86_64-unknown-linux-gnu.zip
  sudo unzip eza_x86_64-unknown-linux-gnu.zip -d /usr/local/bin/
  rm eza_x86_64-unknown-linux-gnu.zip
  mkdir ~/.config/eza
  cp ../Eza/one_dark.yml ~/.config/eza/theme.yml
  /usr/bin/fish -c "alias --save ls 'eza --icons -lh'"
  endCommandGroup "Install eza"

  startCommandGroup "Set fish as default"
  chsh -s $(which fish)
  endCommandGroup "Set fish as default"

  startCommandGroup "Setup man page completions"
  /usr/bin/fish -c fish_update_completions
  endCommandGroup "Setup man page completions"

  startCommandGroup "Install fisher"
  /usr/bin/fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
  endCommandGroup "Install fisher"

  startCommandGroup "Install tide"
  /usr/bin/fish -c 'fisher install IlanCosman/tide@v6'
  endCommandGroup "Install tide"
}

installSoftware()
{
  startCommandGroup "Install LibreWolf"
  flatpak install flathub io.gitlab.librewolf-community -y
  cp ../LibreWolf/librewolf.overrides.cfg ~/.var/app/io.gitlab.librewolf-community/.librewolf/
  flatpak run io.gitlab.librewolf-community about:preferences
  endCommandGroup "Install LibreWolf"

  startCommandGroup "Install Bitwarden extension"
  flatpak run io.gitlab.librewolf-community https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/
  endCommandGroup "Install Bitwarden extension"

  startCommandGroup "Install HEIC support"
  sudo dnf install heif-pixbuf-loader libheif-freeworld -y
  endCommandGroup "Install HEIC support"

  startCommandGroup "Install VLC"
  sudo dnf install intel-media-driver -y
  sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
  sudo dnf install vlc -y
  endCommandGroup "Install VLC"

  startCommandGroup "Install Alacritty"
  sudo dnf install alacritty -y
  mkdir ~/.config/alacritty
  cp ../Alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
  endCommandGroup "Install Alacritty"
}

configureGnome()
{
  startCommandGroup "Install Gnome add-ons"
  sudo dnf install gnome-extensions-app gnome-tweaks pop-icon-theme -y
  endCommandGroup "Install Gnome add-ons"

  startCommandGroup "Install Gnome extensions"
  sudo dnf install gnome-shell-extension-pop-shell gnome-shell-extension-blur-my-shell -y
  endCommandGroup "Install Gnome extensions"

  startCommandGroup "Setup Gnome interface"
  gsettings set org.gnome.desktop.interface clock-format '24h'
  gsettings set org.gnome.desktop.interface show-battery-percentage true
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface cursor-theme 'Pop'
  gsettings set org.gnome.desktop.interface icon-theme 'Pop'
  gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
  endCommandGroup "Setup Gnome interface"

  startCommandGroup "Setup Gnome fonts"
  gsettings set org.gnome.desktop.interface document-font-name 'DaddyTimeMono Nerd Font 11'
  gsettings set org.gnome.desktop.interface font-name 'DaddyTimeMono Nerd Font 11'
  gsettings set org.gnome.desktop.interface monospace-font-name 'DaddyTimeMono Nerd Font 10'
  gsettings set org.gnome.desktop.wm.preferences titlebar-font 'DaddyTimeMono Nerd Font Bold 11'
  endCommandGroup "Setup Gnome fonts"

  startCommandGroup "Setup Gnome privacy"
  gsettings set org.gnome.desktop.privacy remove-old-temp-files true
  gsettings set org.gnome.desktop.privacy remove-old-trash-files true
  gsettings set org.gnome.desktop.privacy old-files-age "30"
  gsettings set org.gnome.desktop.privacy report-technical-problems false
  gsettings set org.gnome.desktop.privacy send-software-usage-stats false
  endCommandGroup "Setup Gnome privacy"

  startCommandGroup "Setup Gnome Touchpad"
  gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
  endCommandGroup "Setup Gnome Touchpad"

  startCommandGroup "Setup Gnome extensions"
  gsettings set org.gnome.shell enabled-extensions "['background-logo@fedorahosted.org', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'pop-shell@system76.com', 'blur-my-shell@aunetx']"
  gsettings set org.gnome.shell favorite-apps "['io.gitlab.librewolf-community.desktop', 'Alacritty.desktop', 'code.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop']"
  gsettings set org.fedorahosted.background-logo-extension logo-always-visible true
  gsettings set org.fedorahosted.background-logo-extension logo-border 7
  gsettings set org.fedorahosted.background-logo-extension logo-opacity 47
  gsettings set org.fedorahosted.background-logo-extension logo-position 'bottom-right'
  gsettings set org.fedorahosted.background-logo-extension logo-size 6.096
  endCommandGroup "Setup Gnome extensions"

  startCommandGroup "Setup Gnome default apps"
  gnome-control-center applications
  endCommandGroup "Setup Gnome default apps"
}

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
                         endCommandGroup "Install Thonny";
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
      "Obsidian.")
    select option in "${options[@]}" "Back"; do
      case "$option" in
        "${options[0]}") startCommandGroup "Install Flatsweep & Flatseal";
                         flatpak install flathub io.github.giantpinkrobots.flatsweep -y;
                         flatpak install flathub com.github.tchx84.Flatseal -y;
                         endCommandGroup "Install Flatsweep & Flatseal";
                         sleep 3; break;;
        "${options[1]}") startCommandGroup "Install Obsidian";
                         flatpak install flathub md.obsidian.Obsidian -y;
                         endCommandGroup "Install Obsidian";
                         sleep 3; break;;
        "Back") return;;
        *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid selection.\e[0m";
      esac
    done
  done
}

while true; do
  clear
  echo -e "\e[35mFedora post-installation scripts.\e[0m"
  echo
  PS3="Select an option to run: "
  options=("System setup." \
    "Install NVidia drivers." \
    "Install fonts." \
    "Install Fish." \
    "Install base software." \
    "Configure Gnome." \
    "Install dev environment." \
    "Install extra software.")
  select option in "${options[@]}" "Quit"; do
    case "$option" in
      "${options[0]}") systemSetup; sleep 3; break;;
      "${options[1]}") installNVidia; sleep 3; break;;
      "${options[2]}") installFonts; sleep 3; break;;
      "${options[3]}") installFish; sleep 3; break;;
      "${options[4]}") installSoftware; sleep 3; break;;
      "${options[5]}") configureGnome; sleep 3; break;;
      "${options[6]}") installDevEnvironment; break;;
      "${options[7]}") installExtraSoftware; break;;
      "Quit") exit;;
      *) echo -e "\e[36m[\e[31mERROR\e[36m] Invalid option.\e[0m";
    esac
  done
done
