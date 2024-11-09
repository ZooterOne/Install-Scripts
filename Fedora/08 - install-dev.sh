#!/bin/bash

source "00 - common-functions.sh"

startCommandGroup "Install .Net SDK"
sudo dnf install dotnet-sdk-8.0
endCommandGroup "Install .Net SDK"

startCommandGroup "Install C++ environment"
sudo dnf install gcc gcc-c++ gdb cmake clang autoconf automake
endCommandGroup "Install C++ environment"
