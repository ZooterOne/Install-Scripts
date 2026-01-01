#!/bin/bash


installFish()
{
  startCommandGroup "Install fish"
  sudo dnf install util-linux-user fish -y
  endCommandGroup "Install fish"

  startCommandGroup "Setup man page completions"
  /usr/bin/fish -c fish_update_completions
  endCommandGroup "Setup man page completions"
}

setupFishAsDefaultShell()
{
  startCommandGroup "Setup fish as default"
  chsh -s $(which fish)
  endCommandGroup "Setup fish as default"
}

installFishTide()
{
  startCommandGroup "Install fisher"
  /usr/bin/fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
  endCommandGroup "Install fisher"

  startCommandGroup "Install tide"
  /usr/bin/fish -c 'fisher install IlanCosman/tide@v6'
  endCommandGroup "Install tide"
}

installStarship()
{
  startCommandGroup "Install starship"
  sudo dnf copr enable atim/starship -y
  sudo dnf install starship -y
  cp ../Starship/starship.toml ~/.config/starship.toml
  echo 'eval "$(starship init bash)"' >> ~/.bashrc
  echo 'starship init fish | source' >> ~/.config/fish/config.fish
  endCommandGroup "Install starship"
}

installAlacritty()
{
  startCommandGroup "Install Alacritty"
  sudo dnf install alacritty -y
  mkdir ~/.config/alacritty
  cp ../Alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
  endCommandGroup "Install Alacritty"
}

installEza()
{
  startCommandGroup "Install eza"
  sudo dnf copr enable alternateved/eza -y
  sudo dnf install eza -y
  mkdir ~/.config/eza
  cp ../Eza/one_dark.yml ~/.config/eza/theme.yml
  endCommandGroup "Install eza"
}

setupEzaAlias()
{
  startCommandGroup "Setup eza"
  /usr/bin/fish -c "alias --save ls 'eza --icons -lh'"
  alias ls="eza --icons -lh"
  endCommandGroup "Setup eza"
}

setupEzaAliasNoIcons()
{
  startCommandGroup "Setup eza"
  /usr/bin/fish -c "alias --save ls 'eza -lh'"
  alias ls="eza -lh"
  endCommandGroup "Setup eza"
}