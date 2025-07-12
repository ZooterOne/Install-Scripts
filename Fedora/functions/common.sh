#!/bin/bash


startCommandGroup()
{
  echo -e "\e[36m[----] $1.\e[0m"
}

endCommandGroup()
{
  if [[ $? -eq 0 ]]; then
    echo -e "\e[36m[\e[32m OK \e[36m] $1.\e[0m"
  else
    echo -e "\e[36m[\e[31mFAIL\e[36m] $1.\e[0m"
  fi
}
