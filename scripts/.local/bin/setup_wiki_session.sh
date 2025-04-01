#!/bin/bash

SESSION_NAME="wiki"

# Check if the session exists, and create it if not
tmux has-session -t $SESSION_NAME 2>/dev/null
if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION_NAME
fi

# Check if window 1 ("Questions") exists, if not, rename the first window
tmux list-windows -t $SESSION_NAME | grep -q "Questions"
if [ $? != 0 ]; then
    # Rename the first window to "Questions"
    tmux rename-window -t $SESSION_NAME:1 "Questions"
    tmux send-keys -t $SESSION_NAME:1 "nvim ~/wiki/index.md" C-m
fi

# Check if window 2 exists, create it if it doesn't
tmux list-windows -t $SESSION_NAME | grep -q "Recall"
if [ $? != 0 ]; then
    tmux new-window -t $SESSION_NAME:2 -n "Recall" "nvim ~/wiki/recall_$(date +%Y-%m-%d).md"
fi

# Check if window 3 exists, create it if it doesn't
tmux list-windows -t $SESSION_NAME | grep -q "Daily Notes"
if [ $? != 0 ]; then
    tmux new-window -t $SESSION_NAME:3 -n "Daily Notes" "nvim ~/wiki/diary/$(date +%Y-%m-%d).md"
fi

# Set the initial window to window 1 (Questions)
tmux select-window -t $SESSION_NAME:1

