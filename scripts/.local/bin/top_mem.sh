#!/bin/bash

# Define icon mappings
declare -A icons
icons=( 
  ["firefox"]="" 
  ["chrome"]="" 
  ["brave"]=""
  ["spotify"]="" 
  ["vlc"]="" 
  ["code"]="" 
  ["wezterm"]="" 
)

# Get the top memory-consuming process
read app mem <<< $(ps --no-headers -eo comm,%mem --sort=-%mem | awk 'NR==1 {print $1, $2}')

# Use the icon if available, otherwise show the app name
icon=${icons[$app]:-$app}

# Output icon + memory usage
echo "%{F#B90E0A}$icon%{F-} $mem%"
