#!/bin/bash


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

setupStarship()
{
  startCommandGroup "Setup starship"
  cp ./Starship/starship.toml ~/.config/starship.toml
  endCommandGroup "Setup starship"
}

setupStarshipBash()
{
  startCommandGroup "Setup starship"
  echo 'eval "$(starship init bash)"' >> ~/.bashrc
  endCommandGroup "Setup starship"
}

setupStarshipFish()
{
  startCommandGroup "Setup starship"
  echo 'starship init fish | source' >> ~/.config/fish/config.fish
  endCommandGroup "Setup starship"
}

setupAlacritty()
{
  startCommandGroup "Setup Alacritty"
  mkdir ~/.config/alacritty
  cp ./Alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
  endCommandGroup "Setup Alacritty"
}

setupEza()
{
  startCommandGroup "Setup eza"
  mkdir ~/.config/eza
  cp ./Eza/one_dark.yml ~/.config/eza/theme.yml
  endCommandGroup "Setup eza"
}

setupEzaBashAlias()
{
  startCommandGroup "Setup eza"
  alias ls="eza --icons -lh"
  endCommandGroup "Setup eza"
}

setupEzaBashAliasNoIcons()
{
  startCommandGroup "Setup eza"
  alias ls="eza -lh"
  endCommandGroup "Setup eza"
}

setupEzaFishAlias()
{
  startCommandGroup "Setup eza"
  /usr/bin/fish -c "alias --save ls 'eza --icons -lh'"
  endCommandGroup "Setup eza"
}

setupEzaFishAliasNoIcons()
{
  startCommandGroup "Setup eza"
  /usr/bin/fish -c "alias --save ls 'eza -lh'"
  endCommandGroup "Setup eza"
}
