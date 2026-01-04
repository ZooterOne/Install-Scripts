#!/bin/bash


#####################################################################
# Basic software
#####################################################################

setupFirefox()
{
  startCommandGroup "Setup Firefox"
  firefox https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/
  firefox https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/
  firefox about:preferences
  endCommandGroup "Setup Firefox"
}

installHEIC()
{
  startCommandGroup "Install HEIC support"
  sudo dnf install heif-pixbuf-loader libheif-freeworld libheif-tools -y
  endCommandGroup "Install HEIC support"
}

installVLC()
{
  startCommandGroup "Install VLC"
  sudo dnf install intel-media-driver -y
  sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
  sudo dnf install vlc -y
  endCommandGroup "Install VLC"
}

installBroadcomDriver()
{
  startCommandGroup "Install Broadcom driver"
  sudo dnf install broadcom-wl -y
  endCommandGroup "Install Broadcom driver"
}

#####################################################################
# Flatpak utilities
#####################################################################

installWarehouse()
{
  startCommandGroup "Install Warehouse"
  flatpak install flathub io.github.flattool.Warehouse -y
  endCommandGroup "Install Warehouse"
}

installFlatseal()
{
  startCommandGroup "Install Flatseal"
  flatpak install flathub com.github.tchx84.Flatseal -y
  endCommandGroup "Install Flatseal"
}

installBazaar()
{
  startCommandGroup "Install Bazaar"
  flatpak install flathub io.github.kolunmi.Bazaar -y
  endCommandGroup "Install Bazaar"
}

#####################################################################
# System software
#####################################################################

installFastfetch()
{
  startCommandGroup "Install Fastfetch"
  sudo dnf install fastfetch -y
  endCommandGroup "Install Fastfetch"
}

setupFastfetch()
{
  startCommandGroup "Setup Fastfetch"
  mkdir ~/.config/fastfetch
  cp ../Fastfetch/config.jsonc ~/.config/fastfetch/
  endCommandGroup "Setup Fastfetch"
}

setupFastfetchNoIcons()
{
  startCommandGroup "Setup Fastfetch"
  mkdir ~/.config/fastfetch
  cp ../Fastfetch/config-simple.jsonc ~/.config/fastfetch/config.jsonc
  endCommandGroup "Setup Fastfetch"
}

setupAlacrittyFastfetch()
{
  startCommandGroup "Install Fastfetch on Alacritty"
  cp ../Alacritty/alacritty_fastfetch.toml ~/.config/alacritty/alacritty.toml
  endCommandGroup "Install Fastfetch on Alacritty"
}

setupBashFastfetch()
{
  startCommandGroup "Install Fastfetch on Bash"
  echo "fastfetch" | sudo tee -a ~/.bashrc
  endCommandGroup "Install Fastfetch on Bash"
}

setupFishFastfetch()
{
  startCommandGroup "Install Fastfetch on Fish"
  echo "fastfetch" | sudo tee -a ~/.config/fish/config.fish
  endCommandGroup "Install Fastfetch on Fish"
}

installBtop()
{
  startCommandGroup "Install Btop"
  sudo dnf install btop -y
  endCommandGroup "Install Btop"
}

installMissionCenter()
{
  startCommandGroup "Install MissionCenter"
  flatpak install flathub io.missioncenter.MissionCenter -y
  endCommandGroup "Install MissionCenter"
}

#####################################################################
# Network software
#####################################################################

installNmap()
{
  startCommandGroup "Install Nmap"
  sudo dnf install nmap -y
  endCommandGroup "Install Nmap"
}

installProtonVPNCli()
{
  startCommandGroup "Install Proton VPN"
  sudo dnf install https://repo.protonvpn.com/fedora-$(rpm -E %fedora)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.3-1.noarch.rpm -y && sudo dnf check-update --refresh -y
  sudo dnf install proton-vpn-cli -y
  endCommandGroup "Install Proton VPN"
}

installProtonVPNDesktop()
{
  startCommandGroup "Install Proton VPN"
  sudo dnf install https://repo.protonvpn.com/fedora-$(rpm -E %fedora)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.3-1.noarch.rpm -y && sudo dnf check-update --refresh -y
  sudo dnf install proton-vpn-gnome-desktop -y
  endCommandGroup "Install Proton VPN"
}

installTransmissionCli()
{
  startCommandGroup "Install Transmission"
  sudo dnf install transmission-cli -y
  endCommandGroup "Install Transmission"
}

installTransmissionDesktop()
{
  startCommandGroup "Install Transmission"
  sudo dnf install transmission -y
  endCommandGroup "Install Transmission"
}

#####################################################################
# Office software
#####################################################################

installObsidian()
{
  startCommandGroup "Install Obsidian"
  flatpak install flathub md.obsidian.Obsidian -y
  endCommandGroup "Install Obsidian"
}

installApostrophe()
{
  startCommandGroup "Install Apostrophe"
  sudo dnf install apostrophe -y
  endCommandGroup "Install Apostrophe"
}

#####################################################################
# Creativity software
#####################################################################

installGimp()
{
  startCommandGroup "Install Gimp"
  flatpak install flathub org.gimp.GIMP -y
  endCommandGroup "Install Gimp"
}

installKdenlive()
{
  startCommandGroup "Install Kdenlive"
  flatpak install flathub org.kde.kdenlive -y
  endCommandGroup "Install Kdenlive"
}

installAudacity()
{
  startCommandGroup "Install Audacity"
  flatpak install flathub org.audacityteam.Audacity -y
  endCommandGroup "Install Audacity"
}

installSwitcheroo()
{
  startCommandGroup "Install Switcheroo"
  flatpak install flathub io.gitlab.adhami3310.Converter -y
  endCommandGroup "Install Switcheroo"
}

installPipeline()
{
  startCommandGroup "Install Pipeline"
  flatpak install flathub de.schmidhuberj.tubefeeder -y
  endCommandGroup "Install Pipeline"
}

#####################################################################
# Virtualization software
#####################################################################

installVirtualBox()
{
  startCommandGroup "Install Virtualbox"
  sudo wget --directory-prefix /etc/yum.repos.d https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
  sudo dnf install VirtualBox-7.2 -y
  sudo usermod -a -G vboxusers $(whoami)
  vbVersion = $(vboxmanage -v | cut -dr -f1)
  wget --directory-prefix ~/Downloads https://download.virtualbox.org/virtualbox/$vbVersion/Oracle_VirtualBox_Extension_Pack-$vbVersion.vbox-extpack
  sudo vboxmanage extpack install ~/Downloads/Oracle_VirtualBox_Extension_Pack-$vbVersion.vbox-extpack
  rm -f ~/Downloads/Oracle_VirtualBox_Extension_Pack-$vbVersion.vbox-extpack
  endCommandGroup "Install Virtualbox"
}

installDistrobox()
{
  startCommandGroup "Install Distrobox"
  sudo dnf install distrobox -y
  endCommandGroup "Install Distrobox"
}

installBoxBuddy()
{
  startCommandGroup "Install BoxBuddy"
  flatpak install flathub io.github.dvlv.boxbuddyrs -y
  endCommandGroup "Install BoxBuddy"
}

#####################################################################
# AI software
#####################################################################

installOllama()
{
  startCommandGroup "Install Ollama"
  curl -fsSL https://ollama.com/install.sh | sh
  endCommandGroup "Install Ollama"
}

installOllamaGptModel()
{
  startCommandGroup "Install Gpt-Oss Model"
  ollama pull gpt-oss:latest
  endCommandGroup "Install Gpt-Oss Model"
}
