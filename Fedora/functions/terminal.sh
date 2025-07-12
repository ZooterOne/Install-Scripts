#!/bin/bash

source "common.sh"


setupTerminal()
{
  startCommandGroup "Install fish"
  sudo dnf install util-linux-user fish -y
  endCommandGroup "Install fish"

  startCommandGroup "Setup man page completions"
  /usr/bin/fish -c fish_update_completions
  endCommandGroup "Setup man page completions"

  startCommandGroup "Install fisher"
  /usr/bin/fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
  endCommandGroup "Install fisher"

  startCommandGroup "Install tide"
  /usr/bin/fish -c 'fisher install IlanCosman/tide@v6'
  endCommandGroup "Install tide"

  startCommandGroup "Install Alacritty"
  sudo dnf install alacritty -y
  mkdir ~/.config/alacritty
  cp ../Alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
  endCommandGroup "Install Alacritty"

  startCommandGroup "Install eza"
  wget https://github.com/eza-community/eza/releases/download/v0.21.3/eza_x86_64-unknown-linux-gnu.zip
  sudo unzip eza_x86_64-unknown-linux-gnu.zip -d /usr/local/bin/
  rm eza_x86_64-unknown-linux-gnu.zip
  mkdir ~/.config/eza
  cp ../Eza/one_dark.yml ~/.config/eza/theme.yml
  /usr/bin/fish -c "alias --save ls 'eza --icons -lh'"
  endCommandGroup "Install eza"
}
