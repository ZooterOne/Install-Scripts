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

installOpenWebUI()
{
  startCommandGroup "Install Open WebUI"
  sudo mkdir -p /opt/OpenWebUI
  sudo chmod a+rwx /opt/OpenWebUI
  cd /opt/OpenWebUI
  python3.12 -m venv .venv
  source .venv/bin/activate
  pip install open-webui
  deactivate
  wget -O /opt/OpenWebUI/open-webui.png https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/open-webui-light.png
  echo -e "[Desktop Entry]\nName=Open WebUI\nIcon=/opt/OpenWebUI/open-webui.png" | tee ~/.local/share/applications/openwebui.desktop >/dev/null
  echo -e "Exec=/opt/OpenWebUI/run.sh\nTerminal=true" | tee -a ~/.local/share/applications/openwebui.desktop >/dev/null
  echo -e "Type=Application\nCategories=AI;Development" | tee -a ~/.local/share/applications/openwebui.desktop >/dev/null
  echo -e "#!/bin/bash\n\ncd /opt/OpenWebUI\n" | tee /opt/OpenWebUI/run.sh >/dev/null
  echo -e "source .venv/bin/activate\npip install -U open-webui\nopen-webui serve\ndeactivate" | tee -a /opt/OpenWebUI/run.sh >/dev/null
  chmod a+x /opt/OpenWebUI/run.sh
  endCommandGroup "Install Open WebUI"
}
