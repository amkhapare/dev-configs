#!/bin/bash

source $HOME/development/local-dev/dev-configs/tmux/scripts/util.sh

SESSION="LEO"

if session_exists $SESSION; then
    ### GC Session ###
    tmux new-session -d -s $SESSION
    # Editor
    NAME="REPO"
    tmux rename-window -t 1 $NAME
    tmux send-keys -t $NAME "leo; nvim ." C-m
    # Dev server
    tmux new-window -n "DEV_SERVER"
    tmux select-window -t 2
    tmux send-keys "leo; env shell system; bash install_leo.sh" C-m
    tmux attach-session -t $SESSION:1
else
    echo "Active $SESSION session exists..."
fi
