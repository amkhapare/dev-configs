#!/bin/bash

source $HOME/development/local-dev/dev-configs/tmux/scripts/util.sh

SESSION="SSE"

if session_exists $SESSION; then
    tmux new-session -d -s $SESSION
    tmux rename-window -t 1 "SSE"
    tmux send-keys -t "SSE" "sse" C-m
    tmux new-window -n "IDE"
    tmux select-window -t 2
    tmux send-keys -t "IDE" "sse; nvim ." C-m
    sleep 2
    tmux send-keys -t "IDE" " ac"
    if [ -n "$TMUX" ]; then
        tmux switch-client -t $SESSION:1
    else
        tmux attach-session -t $SESSION:1
    fi
else
    echo "Active $SESSION session exists..."
fi
