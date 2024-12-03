#!/bin/bash

source "00 - common-functions.sh"

startCommandGroup "Install .Net SDK"
sudo dnf install dotnet-sdk-8.0 -y
endCommandGroup "Install .Net SDK"

startCommandGroup "Install C++ environment"
sudo dnf install gcc gcc-c++ gdb cmake clang autoconf automake -y
endCommandGroup "Install C++ environment"

startCommandGroup "Install GitHub tool"
sudo dnf install gh -y
endCommandGroup "Install GitHub tool"

startCommandGroup "Install VSCode"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
printf "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee -a /etc/yum.repos.d/vscode.repo
sudo dnf install code -y
mkdir -p ~/.config/Code/User/
cp ../Code/settings.json ~/.config/Code/User/settings.json
endCommandGroup "Install VSCode"
