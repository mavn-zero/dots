#!/bin/sh

CURRENT=$(hyprctl activeworkspace | grep 'workspace ID' | awk '{print $3}')

if [ "$1" = "up" ]; then
  # Scroll Up: Only if we are not on workspace 1
  if [ "$CURRENT" -gt 1 ]; then
    hyprctl dispatch workspace m-1
  fi
elif [ "$1" = "down" ]; then
  # Scroll Down: Only if we are not on the last workspace
  MAX=$(hyprctl workspaces | grep 'workspace ID' | awk '{print $3}' | sort -n | tail -1)
  if [ "$CURRENT" -lt "$MAX" ]; then
    hyprctl dispatch workspace m+1
  fi
fi
