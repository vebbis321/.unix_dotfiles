#!/bin/bash

chosen=$(nmcli -t -f ssid dev wifi | awk 'NF' | sort | uniq | rofi -dmenu -p "Select Wi-Fi")

if [ -n "$chosen" ]; then
    nmcli dev wifi connect "$chosen" --ask
fi

