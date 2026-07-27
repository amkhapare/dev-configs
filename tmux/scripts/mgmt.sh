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
    tmux new-window -n "ng-zt-ui"
    tmux select-window -t 2
    tmux send-keys "ngzt; nvim ." C-m
    # Start opencode
    tmux new-window -n "opencode"
    tmux select-window -t 3
    tmux send-keys "ztna; " C-m
    # Start claude
    tmux new-window -n "claude"
    tmux select-window -t 4
    tmux send-keys "ztna; " C-m
    # SSH to engg VM
    # tmux new-window -n "DEV-VM"
    # tmux select-window -t 4
    # tmux send-keys "my-ubuntu" C-m
    tmux attach-session -t $SESSION:1
else
    echo "Active $SESSION session exists..."
fi
