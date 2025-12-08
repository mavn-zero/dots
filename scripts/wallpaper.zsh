#!/bin/bash

# Usage: ./wallpaper.sh path/to/image.jpg

# 1. Set the Wallpaper with awww
#    Note: awww uses the same transition logic as swww
awww img "$1" --transition-type grow --transition-pos 0.854,0.977 --transition-step 90

# 2. Run Wallust to generate colors
#    (We use the 'kmeans' backend + 'harddark16' palette we configured earlier)
wallust run "$1"

# 3. Reload Waybar to pick up the new colors
killall waybar
waybar &

# 4. (Optional) Send a notification
notify-send "Theme Updated" "Wallpaper and colors applied successfully."
