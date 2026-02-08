#!/bin/bash


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
