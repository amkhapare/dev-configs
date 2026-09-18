#!/bin/bash

source $HOME/development/local-dev/dev-configs/tmux/scripts/util.sh

SESSION="PDE-AI"

if ! session_exists $SESSION; then
    ### PDE-AI Session ###
    tmux new-session -d -s $SESSION -c $HOME
    sleep 0.5
    # EAA workspace
    tmux rename-window -t $SESSION:1 "EAA wksp"
    tmux send-keys -t $SESSION:1 "ew" C-m
fi
tmux attach-session -t $SESSION:1
