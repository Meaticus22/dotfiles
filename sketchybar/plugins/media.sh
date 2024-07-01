#!/bin/bash

# Extract the state from the INFO variable
STATE="$(echo "$INFO" | jq -r '.state')"

# Extract the app name and other details from the INFO variable
APP_NAME="$(echo "$INFO" | jq -r '.app')"
TITLE="$(echo "$INFO" | jq -r '.title')"
ARTIST="$(echo "$INFO" | jq -r '.artist')"

# Format the media info differently based on the app
if [ "$APP_NAME" = "Spotify" ] || [ "$APP_NAME" = "Music" ]; then
  # For Spotify and Music, format as "Title - Artist"
  MEDIA="$TITLE - $ARTIST"
else
  # For other apps, you might want to handle differently or just skip
  MEDIA=""
fi

# Update the Sketchybar item based on the state and formatted media info
if [ "$STATE" = "playing" ]; then
  sketchybar --set $NAME label="$MEDIA" drawing=on
else
  sketchybar --set $NAME drawing=off
fi

