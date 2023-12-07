#!/bin/bash

echo -e "\033[0;36m-- Installing fish --\e[0m"
sudo dnf install util-linux-user fish -y

echo -e "\033[0;36m-- Setting fish as default --\e[0m"
chsh -s $(which fish)
