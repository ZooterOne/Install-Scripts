#!/bin/bash


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
