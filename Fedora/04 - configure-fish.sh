#!/usr/bin/env fish

function startCommandGroup
    printf '\033[36m[****]\033[0m %s.\n' "$argv[1]"    
end

function endCommandGroup
    if test "$status" -eq 0
        printf '\033[32m[-OK-]\033[0m'
    else
        printf '\033[31m[FAIL]\033[0m'
    end
    printf ' %s.\n' "$argv[1]"
end

startCommandGroup "Setup man page completions"
fish_update_completions
endCommandGroup "Setup man page completions"

startCommandGroup "Install fisher"
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
endCommandGroup "Install fisher"

startCommandGroup "Install tide"
fisher install IlanCosman/tide@v6
endCommandGroup "Install tide"
