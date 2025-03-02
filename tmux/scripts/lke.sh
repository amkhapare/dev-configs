#!/bin/bash

source $HOME/development/local-dev/dev-configs/tmux/scripts/util.sh

SESSION="LKE"

if session_exists $SESSION; then
    ### GC Session ###
    tmux new-session -d -s $SESSION
    # Start mpop k9s session
    MPOP="MPOP"
    tmux rename-window -t 1 $MPOP
    tmux send-keys -t $MPOP "mpop" C-m
    # Start dpop k9s session
    tmux new-window -n "DPOP"
    tmux select-window -t 2
    tmux send-keys "dpop" C-m
    tmux attach-session -t $SESSION:1
else
    echo "Active $SESSION session exists..."
fi
