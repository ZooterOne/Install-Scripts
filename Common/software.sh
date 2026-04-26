#!/bin/bash


setupFirefox()
{
  startCommandGroup "Setup Firefox"
  firefox https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/
  firefox https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/
  firefox https://addons.mozilla.org/en-US/firefox/addon/cookie-quick-manager/
  firefox about:preferences
  endCommandGroup "Setup Firefox"
}

#####################################################################
# System software
#####################################################################

setupFastfetch()
{
  startCommandGroup "Setup Fastfetch"
  mkdir ~/.config/fastfetch
  cp ./Fastfetch/config.jsonc ~/.config/fastfetch/
  endCommandGroup "Setup Fastfetch"
}

setupFastfetchNoIcons()
{
  startCommandGroup "Setup Fastfetch"
  mkdir ~/.config/fastfetch
  cp ./Fastfetch/config-simple.jsonc ~/.config/fastfetch/config.jsonc
  endCommandGroup "Setup Fastfetch"
}

setupAlacrittyFastfetch()
{
  startCommandGroup "Install Fastfetch on Alacritty"
  installedCommandCheck alacritty
  if [ $? -eq 0 ]; then
    cp ./Alacritty/alacritty_fastfetch.toml ~/.config/alacritty/alacritty.toml
  else
    false
  fi
  endCommandGroup "Install Fastfetch on Alacritty"
}

setupBashFastfetch()
{
  startCommandGroup "Install Fastfetch on Bash"
  echo "fastfetch" | sudo tee -a ~/.bashrc
  endCommandGroup "Install Fastfetch on Bash"
}

setupFishFastfetch()
{
  startCommandGroup "Install Fastfetch on Fish"
  echo "fastfetch" | sudo tee -a ~/.config/fish/config.fish
  endCommandGroup "Install Fastfetch on Fish"
}

#####################################################################
# Network software
#####################################################################

installPostman()
{
  startCommandGroup "Install Postman"
  wget -O ~/Downloads/postman.tar.gz https://dl.pstmn.io/download/latest/linux_64
  sudo tar -xzf ~/Downloads/postman.tar.gz -C /opt/
  rm -f ~/Downloads/postman.tar.gz
  sudo ln -s /opt/Postman/Postman /usr/bin/postman
  echo -e "[Desktop Entry]\nName=Postman\nComment=Postman Desktop" | sudo tee /usr/share/applications/postman.desktop
  echo -e "Exec=/opt/Postman/Postman\nIcon=/opt/Postman/app/icons/icon_128x128.png" | sudo tee -a /usr/share/applications/postman.desktop
  echo -e "Terminal=false\nType=Application\nCategories=Development;Network;" | sudo tee -a /usr/share/applications/postman.desktop
  endCommandGroup "Install Postman"
}

#####################################################################
# AI software
#####################################################################

installOllama()
{
  startCommandGroup "Install Ollama"
  curl -fsSL https://ollama.com/install.sh | sh
  endCommandGroup "Install Ollama"
}

installOllamaQwen36Model()
{
  startCommandGroup "Install Qwen 3.6 Model"
  ollama pull qwen3.6:35b
  endCommandGroup "Install Qwen 3.6 Model"
}

installOllamaQwen35Model()
{
  startCommandGroup "Install Qwen 3.5 Model"
  ollama pull qwen3.5:9b
  endCommandGroup "Install Qwen 3.5 Model"
}

installOllamaGemma4Models()
{
  startCommandGroup "Install Gemma 4 Models"
  ollama pull gemma4:e4b
  ollama pull gemma4:26b
  endCommandGroup "Install Gemma 4 Models"
}

installOpenWebUI()
{
  startCommandGroup "Install Open WebUI"
  sudo mkdir -p /opt/OpenWebUI
  sudo chmod a+rwx /opt/OpenWebUI
  cp ./OpenWebUI/* /opt/OpenWebUI/
  mv /opt/OpenWebUI/open-webui.desktop ~/.local/share/applications/
  cd /opt/OpenWebUI
  python3.12 -m venv .venv
  source .venv/bin/activate
  pip install open-webui
  deactivate  
  endCommandGroup "Install Open WebUI"
}
