#!/bin/bash

source "00 - common-functions.sh"

startCommandGroup "Install Flatsweep"
flatpak install flathub io.github.giantpinkrobots.flatsweep -y
endCommandGroup "Install Flatsweep"
