#!/bin/bash


configureCosmic()
{
  startCommandGroup "Setup Cosmic desktop environment"
  sudo cp -r ./Cosmic ~/.config/cosmic
  endCommandGroup "Setup Cosmic desktop environment"
}
