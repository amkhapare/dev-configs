#!/bin/bash

source $HOME/development/local-dev/dev-configs/tmux/scripts/util.sh

SESSION="EW"

if session_exists $SESSION; then
    tmux new-session -d -s $SESSION -n "EAA WKSP"
    tmux send-keys -t "$SESSION:EAA WKSP" "ew" C-m
    tmux new-window -t "$SESSION:2" -n "IDE"
    tmux send-keys -t "$SESSION:IDE" "ew; nvim ." C-m
    sleep 2
    tmux send-keys -t "$SESSION:IDE" " ac"
    if [ -n "$TMUX" ]; then
        tmux switch-client -t "$SESSION:1"
    else
        tmux attach-session -t "$SESSION:1"
    fi
else
    echo "Active $SESSION session exists..."
fi
