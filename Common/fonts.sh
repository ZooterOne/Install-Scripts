#!/bin/bash


installDaddyTimeFonts()
{
  startCommandGroup "Install DaddyTime fonts"
  wget --directory-prefix ~/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DaddyTimeMono.zip
  sudo unzip DaddyTimeMono.zip -d /usr/share/fonts/DaddyTimeMono
  rm -f ~/Downloads/DaddyTimeMono.zip
  endCommandGroup "Install DaddyTime fonts"
}

installHurmitFonts()
{
  startCommandGroup "Install Hurmit fonts"
  wget --directory-prefix ~/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hermit.zip
  sudo unzip ~/Downloads/Hermit.zip -d /usr/share/fonts/Hurmit
  rm -f ~/Downloads/Hermit.zip
  endCommandGroup "Install Hurmit fonts"
}

refreshFontCache()
{
  startCommandGroup "Refresh font cache"
  sudo fc-cache -fv
  endCommandGroup "Refresh font cache"
}
