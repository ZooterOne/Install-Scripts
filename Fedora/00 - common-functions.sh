#!/bin/bash

startCommandGroup()
{
    echo -e "\033[36m[----]\033[0m $1."
}

endCommandGroup()
{
    if [[ $? -eq 0 ]]
    then
        echo -e "\033[32m[ OK ]\033[0m $1."
    else
        echo -e "\033[31m[FAIL]\033[0m $1."
    fi
}
