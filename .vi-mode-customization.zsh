#!/bin/zsh
DEFAULT_VI_MODE=viins

KEYTIMEOUT=1

zle-line-init() {
    zle -K $DEFAULT_VI_MODE
}

# if [[ -z "$SSH_CONNECTION" ]]; then
#     bindkey '^[[3~' delete-char
#     bindkey '^[[7~' beginning-of-line
#     bindkey '^[[8~' end-of-line
# else
#     bindkey '^[[3~' delete-char
#     bindkey '^[[1~' beginning-of-line
#     bindkey '^[[4~' end-of-line
# fi

autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line
zle -N edit-command-line

quit() {
    exit
}
zle -N quit

q() {
    exit
}
zle -N q
