#!/bin/bash

# Get current SSID
ssid=$(nmcli -t -f active,ssid dev wifi | grep "^yes" | cut -d: -f2)

# Get signal strength
signal=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^\*' | cut -d: -f2)

# Determine icon based on signal strength
if [ -z "$ssid" ]; then
    icon="󰤮"  # Disconnected icon
    echo "$icon Disconnected"
else
    if [ "$signal" -ge 75 ]; then
        icon="󰤨"  # Strong signal
    elif [ "$signal" -ge 50 ]; then
        icon="󰤢"  # Medium signal
    else
        icon="󰤟"  # Weak signal
    fi
    # echo " %{F#B90E0A}$icon  %{F#C5C8C6}$signal%"
    echo " %{F#B90E0A}$icon"
fi

