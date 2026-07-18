#!/bin/bash


#####################################################################
# System software
#####################################################################

installMissionCenter()
{
  startCommandGroup "Install MissionCenter"
  flatpak install flathub io.missioncenter.MissionCenter -y
  endCommandGroup "Install MissionCenter"
}

#####################################################################
# Office software
#####################################################################

installObsidian()
{
  startCommandGroup "Install Obsidian"
  flatpak install flathub md.obsidian.Obsidian -y
  endCommandGroup "Install Obsidian"
}

installApostrophe()
{
  startCommandGroup "Install Apostrophe"
  flatpak install flathub org.gnome.gitlab.somas.Apostrophe -y
  endCommandGroup "Install Apostrophe"
}

installEloquent()
{
  startCommandGroup "Install Eloquent"
  flatpak install flathub re.sonny.Eloquent -y
  endCommandGroup "Install Eloquent"
}

#####################################################################
# Creativity software
#####################################################################

installGimp()
{
  startCommandGroup "Install Gimp"
  flatpak install flathub org.gimp.GIMP -y
  endCommandGroup "Install Gimp"
}

installKdenlive()
{
  startCommandGroup "Install Kdenlive"
  flatpak install flathub org.kde.kdenlive -y
  endCommandGroup "Install Kdenlive"
}

installAudacity()
{
  startCommandGroup "Install Audacity"
  flatpak install flathub org.audacityteam.Audacity -y
  endCommandGroup "Install Audacity"
}

installSwitcheroo()
{
  startCommandGroup "Install Switcheroo"
  flatpak install flathub io.gitlab.adhami3310.Converter -y
  endCommandGroup "Install Switcheroo"
}

installDefuse()
{
  startCommandGroup "Install Defuse"
  flatpak install flathub io.github.shonebinu.Defuse -y
  endCommandGroup "Install Defuse"
}

installPipeline()
{
  startCommandGroup "Install Pipeline"
  flatpak install flathub de.schmidhuberj.tubefeeder -y
  endCommandGroup "Install Pipeline"
}

#####################################################################
# Virtualization software
#####################################################################

installBoxBuddy()
{
  startCommandGroup "Install BoxBuddy"
  flatpak install flathub io.github.dvlv.boxbuddyrs -y
  endCommandGroup "Install BoxBuddy"
}

#####################################################################
# Development software
#####################################################################

installDevToolbox()
{
  startCommandGroup "Install DevToolbox"
  flatpak install flathub me.iepure.devtoolbox -y
  endCommandGroup "Install DevToolbox"
}

#####################################################################
# AI software
#####################################################################

installNewelle()
{
  startCommandGroup "Install Newelle"
  flatpak install flathub io.github.qwersyk.Newelle -y
  endCommandGroup "Install Newelle"
}
