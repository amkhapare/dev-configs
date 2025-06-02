#!/bin/bash

source $HOME/development/local-dev/dev-configs/tmux/scripts/util.sh

SESSION="zt-ui"

if session_exists $SESSION; then
    ### ZT Session ###
    tmux new-session -d -s $SESSION
    # Create thin env window
    tmux rename-window -t 1 "DEV_SERVER"
    tmux send-keys -t "DEV_SERVER" "ngzt; npm run start" C-m
    tmux split-window -h
    tmux send-keys "zt; npm run start:proxy;" C-m
    # UI Editor
    tmux new-window -n "NG-ZT-UI"
    tmux select-window -t 3
    tmux send-keys "ngzt; nvim ." C-m
    # BE Editor
    tmux new-window -n "ZT-UI"
    tmux select-window -t 4
    tmux send-keys "zt; nvim ." C-m
    # Attach!
    tmux attach-session -t $SESSION:1
else
    echo "Active $SESSION session exists..."
fi

