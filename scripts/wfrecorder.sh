#!/bin/bash
# -----------------------------------------------------
# Minimal Recording Script by Archy
# -----------------------------------------------------

# File to store the process ID
PIDFILE="/tmp/hypr_recording.pid"
FILENAME="/mnt/DATA/Videos/Screenrecordings/rec_$(date +%Y%m%d_%H%M%S).mp4"

# Check if recording is already running
if [ -f "$PIDFILE" ]; then
  # -- STOP RECORDING --
  PID=$(cat "$PIDFILE")

  # Kill the process gracefully
  kill -SIGINT "$PID"

  # Remove the PID file
  rm "$PIDFILE"

  # Send signal to Waybar to update the icon (disable it)
  pkill -RTMIN+8 waybar

  # Send a notification
  notify-send "Recording Saved" "File stored at $FILENAME" -i video-x-generic
else
  # -- START RECORDING --

  # Use slurp to select a region.
  # If you want full screen, remove '-g "$(slurp)"'
  GEOMETRY=$(slurp)

  # Check if user cancelled selection (slurp returns empty)
  if [ -z "$GEOMETRY" ]; then
    exit 1
  fi

  # Start recording in background
  # -f: filename
  # -g: geometry (region)
  # --audio: records default audio source (remove if unwanted)
  wf-recorder -g "$GEOMETRY" -f "$FILENAME" &

  # Save the PID of the background process
  echo $! >"$PIDFILE"

  # Send signal to Waybar to update the icon (enable it)
  pkill -RTMIN+8 waybar

  notify-send "Recording Started" "Capturing selected region..." -i media-record
fi
