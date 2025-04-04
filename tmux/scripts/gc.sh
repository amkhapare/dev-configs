#!/bin/bash

source $HOME/development/local-dev/dev-configs/tmux/scripts/util.sh

SESSION="gc"

if session_exists $SESSION; then
    ### GC Session ###
    tmux new-session -d -s $SESSION
    # Create thin env window
    tmux rename-window -t 1 "THIN_ENV"
    tmux send-keys -t "THIN_ENV" "my-env" C-m
    # Dev servers
    tmux new-window -n "DEV_SERVER"
    tmux select-window -t 2
    tmux send-keys "gc; npm run start" C-m
    tmux split-window -h
    tmux send-keys "gc;cd ../ui; npm run start" C-m
    # UI Editor
    tmux new-window -n "GC_UI"
    tmux select-window -t 3
    tmux send-keys "gc; nvim ." C-m
    # BE Editor
    tmux new-window -n "GCM"
    tmux select-window -t 4
    tmux send-keys "gcm; nvim ." C-m
    # Attach!
    tmux attach-session -t $SESSION:1
else
    echo "Active gc session exists..."
fi

