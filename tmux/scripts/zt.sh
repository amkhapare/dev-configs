#!/bin/bash

source $HOME/development/local-dev/dev-configs/tmux/scripts/util.sh

SESSION="ng-zt-ui"

if session_exists $SESSION; then
    # Dev servers
    tmux new-window -n "DEV_SERVER"
    tmux select-window -t 2
    tmux send-keys "ngzt; npm run start" C-m
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
    echo "Active zt-ui session exists..."
fi

