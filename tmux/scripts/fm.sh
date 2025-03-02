#!/bin/bash

source $HOME/development/local-dev/dev-configs/tmux/scripts/util.sh

SESSION="FM"

if session_exists $SESSION; then
    ### Session ###
    tmux new-session -d -s $SESSION
    # Editor
    NAME="REPO"
    tmux rename-window -t 1 $NAME
    tmux send-keys -t $NAME "fm; nvim ." C-m
    # Start dev server
    tmux new-window -n "FURRY"
    tmux select-window -t 2
    tmux send-keys "fm; npm run serve:furry" C-m
    # Start dev server
    tmux new-window -n "AGENT"
    tmux select-window -t 3
    tmux send-keys "fm; npm run serve:agents" C-m
    tmux attach-session -t $SESSION:1
else
    echo "Active $SESSION session exists..."
fi
