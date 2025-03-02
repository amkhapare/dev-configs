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
    # TODO - START DOCKER -
    tmux attach-session -t $SESSION:1
else
    echo "Active $SESSION session exists..."
fi
