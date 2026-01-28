#!/bin/bash


startCommandGroup()
{
  echo -e "\e[36m[----] $1.\e[0m"
}

endCommandGroup()
{
  if [ $? -eq 0 ]; then
    echo -e "\e[36m[\e[32m OK \e[36m] $1.\e[0m"
  else
    echo -e "\e[36m[\e[31mFAIL\e[36m] $1.\e[0m"
  fi
}

installedCommandCheck()
{
  if [ $# -eq 0 ]; then
    return -1
  elif [ -z "$(rpm -q $1 | grep 'not installed')" ]; then
    return 0
  else
    echo -e "\e[36m[\e[31mFAIL\e[36m] $1 not installed.\e[0m"
    return -1
  fi
}
