#!/usr/bin/env bash

# Define the item name used in Sketchybar
ITEM_NAME="spotifyIndicator"

# Check if Spotify is running
RUNNING=$(osascript -e 'if application "Spotify" is running then return 0')
if [ "$RUNNING" == "" ]; then
  RUNNING=1
fi

PLAYING=1
TRACK=""
ALBUM=""
ARTIST=""

# Get Spotify player state
PLAYER_STATE=$(osascript -e 'if application "Spotify" is running then tell application "Spotify" to get player state')

if [ "$PLAYER_STATE" == "playing" ]; then
  PLAYING=0
  TRACK=$(osascript -e 'tell application "Spotify" to get name of current track')
  ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track')
  ALBUM=$(osascript -e 'tell application "Spotify" to get album of current track')
  
  # Update Sketchybar item with track and artist
  sketchybar -m --set $ITEM_NAME drawing=on label="$TRACK - $ARTIST"
else
  # Turn off drawing and clear label if Spotify is not playing
  sketchybar -m --set $ITEM_NAME drawing=off label=""
fi

