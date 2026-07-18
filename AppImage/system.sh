#!/bin/bash


installAppManager()
{
  startCommandGroup "Install AppManager"
  installedCommandCheck app-manager
  if [ $? -ne 0 ]; then
    wget --directory-prefix ~/Downloads https://github.com/kem-a/AppManager/releases/download/v3.7.2/AppManager-3.7.2-anylinux-x86_64.AppImage
    chmod a+x ~/Downloads/AppManager-3.7.2-anylinux-x86_64.AppImage
    ~/Downloads/AppManager-3.7.2-anylinux-x86_64.AppImage
  fi
  endCommandGroup "Install AppManager"
}
