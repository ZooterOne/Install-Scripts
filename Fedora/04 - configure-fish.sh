#!/usr/bin/env fish

echo -e "\033[0;36m-- Installing fisher --\e[0m"
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

echo -e "\033[0;36m-- Installing tide --\e[0m"
fisher install IlanCosman/tide@v6
