#!/bin/bash

THEME_FILE="$HOME/.config/hypr/theme"

# --- Read Theme Mode ---
CURRENT_MODE="dark" # Default mode
if [[ -f "$THEME_FILE" ]]; then
    MODE_FROM_FILE=$(cat "$THEME_FILE")
    if [[ "$MODE_FROM_FILE" == "light" ]]; then
        CURRENT_MODE="light"
    fi
    # echo "Using theme mode: $CURRENT_MODE"
else
    #echo "Theme file not found. Defaulting to dark mode."
    #echo "dark" > "$THEME_FILE"
    CURRENT_MODE="dark"
fi

# echo icon for waybar 
if [[ "$CURRENT_MODE" == "dark" ]]; then
  echo "" # Moon icon for dark mode
else
  echo "" # Sun icon for light mode
fi