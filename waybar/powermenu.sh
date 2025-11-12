#!/bin/sh

# Use Wofi with our new stylesheet
chosen=$(echo -e " Sleep\n Lock\n Reboot\n Power Off" |
  wofi --dmenu -p "Power Menu" --style ~/dots/waybar/powermenu.css)

# Execute the chosen command
case "$chosen" in
" Sleep")
  systemctl suspend
  ;;
" Lock")
  hyprlock
  ;;
" Reboot")
  systemctl reboot
  ;;
" Power Off")
  systemctl poweroff
  ;;
esac
