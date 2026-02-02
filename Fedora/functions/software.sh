#!/bin/bash


#####################################################################
# Basic software
#####################################################################

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

#####################################################################
# System software
#####################################################################

installFastfetch()
{
  startCommandGroup "Install Fastfetch"
  sudo dnf install fastfetch -y
  endCommandGroup "Install Fastfetch"
}

installBtop()
{
  startCommandGroup "Install Btop"
  sudo dnf install btop -y
  endCommandGroup "Install Btop"
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

installIftop()
{
  startCommandGroup "Install Iftop"
  sudo dnf install iftop -y
  endCommandGroup "Install Iftop"
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

#####################################################################
# Development software
#####################################################################

installGithubTool()
{
  startCommandGroup "Install Github tool"
  sudo dnf install gh -y
  endCommandGroup "Install Github tool"
}

installVSCode()
{
  startCommandGroup "Install VS Code"
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  printf "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee -a /etc/yum.repos.d/vscode.repo
  sudo dnf install code -y
  mkdir -p ~/.config/Code/User/
  cp ../Code/settings.json ~/.config/Code/User/settings.json
  endCommandGroup "Install VS Code"
}

installDotNetSdk()
{
  startCommandGroup "Install .Net SDK"
  sudo dnf install dotnet-sdk-10.0 -y
  endCommandGroup "Install .Net SDK"
}

installCppSDK()
{
  startCommandGroup "Install C++ environment"
  sudo dnf install gcc gcc-c++ gdb cmake clang autoconf automake -y
  endCommandGroup "Install C++ environment"
}

installThonny()
{
  startCommandGroup "Install Thonny"
  sudo dnf install thonny -y
  sudo usermod -aG dialout $(whoami)
  endCommandGroup "Install Thonny"
}

#####################################################################
# AI software
#####################################################################

installOllama()
{
  startCommandGroup "Install Ollama"
  sudo dnf install ollama -y
  endCommandGroup "Install Ollama"
}

installOllamaGptModel()
{
  startCommandGroup "Install Gpt-Oss Model"
  installedCommandCheck ollama
  if [ $? -eq 0 ]; then
    ollama pull gpt-oss:latest
  else
    false
  fi
  endCommandGroup "Install Gpt-Oss Model"
}

installOllamaDevstralModel()
{
  startCommandGroup "Install Devstral Model"
  installedCommandCheck ollama
  if [ $? -eq 0 ]; then
    ollama pull devstral-small-2:latest
  else
    false
  fi
  endCommandGroup "Install Devstral Model"
}