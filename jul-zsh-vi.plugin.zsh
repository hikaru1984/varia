function zle-keymap-select() {
    VI_KEYMAP=$KEYMAP
    zle reset-prompt
    zle -R
}

zle -N zle-keymap-select

function vi-accept-line() {
    VI_KEYMAP=main
    zle accept-line
}

zle -N vi-accept-line


bindkey -v

bindkey -M vicmd '^J' vi-accept-line
bindkey -M vicmd '^M' vi-accept-line

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

bindkey '^P' up-history
bindkey '^N' down-history

bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

if [[ "$NORMAL_INDICATOR" == "" ]]; then
    NORMAL_INDICATOR="%{$fg_bold[red]%}[NORMAL]%{$reset_color%}"
fi

if [[ "$INSERT_INDICATOR" == "" ]]; then
    INSERT_INDICATOR="%{$fg_bold[blue]%}[INSERT]%{$reset_color%}"
fi

function vi_mode_prompt_info() {
    echo "${${VI_KEYMAP/vicmd/$NORMAL_INDICATOR}/(main|viins)/$INSERT_INDICATOR}"
}

if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
    RPS1="%{$reset_color%}$(vi_mode_prompt_info)%{$reset_color%}"
fi
