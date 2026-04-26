#!/usr/bin/env bash

# Set colors based on the system's dark mode setting

fg="colour12"

if command -v gsettings > /dev/null 2>&1; then
    mode=$(gsettings get org.gnome.desktop.interface color-scheme)
else
    mode=""
fi

if [[ $mode == *"dark"* ]]; then
    bg="black"
else
    bg="white"
fi

tmux set-option -g status-bg "$bg"
tmux set-option -g status-fg "$fg"
tmux set-option -g message-style "bg=$bg,fg=$fg"
tmux set-window-option -g window-status-current-style "fg=green"
