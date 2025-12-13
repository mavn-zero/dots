#!/usr/bin/env zsh

# --- Configuration ---
# Your preferred aesthetic defaults
DEFAULT_IN=5
DEFAULT_OUT=10
DEFAULT_ROUND=10
DEFAULT_BORDER=2

# Temporary state file
STATE_FILE="/tmp/hypr_gaps.state"

# --- Get Current Rounding State ---
# We use rounding as the "master switch" to know which mode we are in.
# awk grabs the number after 'int:'
CURRENT_ROUND=$(hyprctl getoption decoration:rounding | awk '/int:/ {print $2}')

# Safety check: Default to 0 if the command fails to return a number
CURRENT_ROUND=${CURRENT_ROUND:-0}

if [[ "$CURRENT_ROUND" -eq 0 ]]; then
    # ============================================================
    # MODE: Currently Zero (Minimal) -> SWITCH TO AESTHETIC
    # ============================================================
    
    # Try to load saved values from the temp file
    if [[ -f "$STATE_FILE" ]]; then
        source "$STATE_FILE"
    fi

    # Restore values (Use SAVED if they exist, otherwise use DEFAULTS)
    hyprctl keyword general:gaps_in ${SAVED_IN:-$DEFAULT_IN}
    hyprctl keyword general:gaps_out ${SAVED_OUT:-$DEFAULT_OUT}
    hyprctl keyword decoration:rounding ${SAVED_ROUND:-$DEFAULT_ROUND}
    hyprctl keyword general:border_size ${SAVED_BORDER:-$DEFAULT_BORDER}
    
    # Optional: Visual Confirmation
    # notify-send "Hyprland" "Aesthetic Mode Active"

else
    # ============================================================
    # MODE: Currently Rounded (Aesthetic) -> SWITCH TO MINIMAL
    # ============================================================

    # 1. Get current values to save them
    CUR_IN=$(hyprctl getoption general:gaps_in | awk '/int:/ {print $2}')
    CUR_OUT=$(hyprctl getoption general:gaps_out | awk '/int:/ {print $2}')
    CUR_BORDER=$(hyprctl getoption general:border_size | awk '/int:/ {print $2}')
    
    # 2. Save state to file
    echo "SAVED_IN=$CUR_IN" > "$STATE_FILE"
    echo "SAVED_OUT=$CUR_OUT" >> "$STATE_FILE"
    echo "SAVED_ROUND=$CURRENT_ROUND" >> "$STATE_FILE"
    echo "SAVED_BORDER=$CUR_BORDER" >> "$STATE_FILE"

    # 3. Apply Zero/Full Screen Settings
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    hyprctl keyword decoration:rounding 0
    
    # Optional: Visual Confirmation
    # notify-send "Hyprland" "Focus Mode Active"
fi
