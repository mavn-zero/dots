#!/usr/bin/zsh

# --- Configuration ---
# Point this to your actual decorations file location
DECO_FILE="$HOME/dots/hypr/decorations.conf"

# --- Parsing Logic ---
# We use grep to find the line and awk to grab the value after the equals sign.
# This handles both "gaps_in = 5" and "gaps_in=5"
# tr -d ' ' removes any accidental whitespace.

# 1. Extract Gaps In
default_gaps_in=$(grep -m 1 "gaps_in" "$DECO_FILE" | awk -F '=' '{print $2}' | tr -d ' ')

# 2. Extract Gaps Out
default_gaps_out=$(grep -m 1 "gaps_out" "$DECO_FILE" | awk -F '=' '{print $2}' | tr -d ' ')

# 3. Extract Rounding (Optional, if you toggle rounding too)
default_rounding=$(grep -m 1 "rounding" "$DECO_FILE" | awk -F '=' '{print $2}' | tr -d ' ')

# Fallback: If parsing fails (empty strings), set safe defaults to prevent errors
default_gaps_in=${default_gaps_in:-5}
default_gaps_out=${default_gaps_out:-10}
default_rounding=${default_rounding:-10}


# --- Toggle Logic ---

# Get current state via hyprctl
current_gap=$(hyprctl getoption general:gaps_out | awk '/int:/ {print $2}')

if [[ "$current_gap" -eq 0 ]]; then
    # State is currently 0, so RESTORE defaults from file
    hyprctl keyword general:gaps_in $default_gaps_in
    hyprctl keyword general:gaps_out $default_gaps_out
    hyprctl keyword decoration:rounding $default_rounding
else
    # State is currently active, so ZERO it out
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    hyprctl keyword decoration:rounding 0
fi
