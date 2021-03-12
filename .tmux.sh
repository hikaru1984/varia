#!/bin/rc

if([ -t 0 ] && ~ $#TMUX 0) {
    tmux attach -t julia || tmux new -s julia; exit
}
