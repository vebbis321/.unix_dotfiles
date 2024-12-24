#!/bin/sh

pane="$(tmux display-message -p '#{window_panes}')" ||  exit 1
echo "$pane"

if (( $pane % 2 == 0 ))
then
    tmux split-window -v -c "#{pane_current_path}"
else
    tmux split-window -h -c "#{pane_current_path}"
fi

