#!/bin/bash

source $HOME/development/local-dev/dev-configs/tmux/scripts/util.sh

SESSION="MGMT"

if session_exists $SESSION; then
    ### GC Session ###
    tmux new-session -d -s $SESSION
    # EDITOR
    NAME="REPO"
    tmux rename-window -t 1 $NAME
    tmux send-keys -t $NAME "mgmt; nvim ." C-m
    # Start dev server
    tmux new-window -n "LKE-MPOP"
    tmux select-window -t 2
    tmux send-keys "mpop" C-m
else
    echo "Active $SESSION session exists..."
fi
