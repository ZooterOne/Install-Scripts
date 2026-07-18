#!/bin/bash


#####################################################################
# AI software
#####################################################################

installAnythingLLM()
{
  startCommandGroup "Install AnythingLLM"
  wget --directory-prefix ~/Downloads https://cdn.anythingllm.com/latest/AnythingLLMDesktop.AppImage
  app-manager install ~/Downloads/AnythingLLMDesktop.AppImage
  endCommandGroup "Install AnythingLLM"
}

installInvokeAI()
{
  startCommandGroup "Install Invoke AI"
  wget --directory-prefix ~/Downloads https://github.com/invoke-ai/launcher/releases/latest/download/Invoke.Community.Edition-latest.AppImage
  app-manager install ~/Downloads/Invoke.Community.Edition-latest.AppImage
  endCommandGroup "Install Invoke AI"
}
