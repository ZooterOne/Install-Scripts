#!/bin/bash

source "00 - common-functions.sh"

startCommandGroup "Install fish"
sudo dnf install util-linux-user fish -y
endCommandGroup "Install fish"

startCommandGroup "Set fish as default"
chsh -s $(which fish)
endCommandGroup "Set fish as default"
