#!/bin/zsh

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{10}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%f%F{11}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

jul_get_welcome_symbol() {
    echo -n "%(?..%F{1})"
    local welcome_symbol='$'
    [ $EUID -ne 0 ] || welcome_symbol='!'
    echo -n $welcome_symbol
    echo -n "%(?..%f)"
}

jul_get_current_branch() {
    local branch=$(git_current_branch)
    if [ -n "$branch" ]; then
        echo -n $ZSH_THEME_GIT_PROMPT_PREFIX
        echo -n $(parse_git_dirty)
        echo -n "‹${branch}›"
        echo -n $ZSH_THEME_GIT_PROMPT_SUFFIX
    fi
}

jul_get_prompt() {
    local user_name="%F{11}%n%f"
    [ $EUID -ne 0 ] || user_name="%F{9}%n%f"
    echo -n $user_name
    echo -n "%B%F{15}@%f"
    echo -n "%F{32}%m%f%b"
    echo -n "%{$reset_color%} %~/"
    echo -n "%{$reset_color%}$(jul_get_current_branch)"
    echo -n "%B%F{32} $(jul_get_welcome_symbol)%f%b%{$reset_color%} "
}

export GREP_COLOR='1;31'
PROMPT='$(jul_get_prompt)'
