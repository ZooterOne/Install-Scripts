#!/bin/bash


installDaddyTimeFonts()
{
  startCommandGroup "Install DaddyTime fonts"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DaddyTimeMono.zip
  sudo unzip DaddyTimeMono.zip -d /usr/share/fonts/DaddyTimeMono
  rm DaddyTimeMono.zip
  endCommandGroup "Install DaddyTime fonts"
}

installHurmitFonts()
{
  startCommandGroup "Install Hurmit fonts"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hermit.zip
  sudo unzip Hermit.zip -d /usr/share/fonts/Hurmit
  rm Hermit.zip
  endCommandGroup "Install Hurmit fonts"
}

refreshFontCache()
{
  startCommandGroup "Refresh font cache"
  sudo fc-cache -fv
  endCommandGroup "Refresh font cache"
}
