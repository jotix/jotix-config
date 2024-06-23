#
# ~/.bashrc
#

alias eza='eza --icons'
alias la='eza -lha'
alias l=la
alias ll='eza -l'
alias ls=eza
alias lt='eza --tree'

### bat
alias cat=bat

### zoxide
alias cd=z

### cd to config folder
alias cdc='cd ~/nixos-config'

POWERLINE_BIN=/nix/store/hmhmf7l5h05513fs91lsz643j9kzs1g5-powerline-go-1.24/bin/powerline-go

function _update_ps1() {
    PS1="$($POWERLINE_BIN -error $? -jobs $(jobs -p | wc -l))"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

fastfetch

eval "$(zoxide init bash)"    
