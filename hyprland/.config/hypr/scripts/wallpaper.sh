#!/bin/bash

THEME_FILE="$HOME/.config/hypr/theme"

# --- Read Theme Mode ---
CURRENT_MODE="dark" # Default mode
if [[ -f "$THEME_FILE" ]]; then
    MODE_FROM_FILE=$(cat "$THEME_FILE")
    if [[ "$MODE_FROM_FILE" == "light" ]]; then
        CURRENT_MODE="light"
    fi
    # Any other content in the file defaults to light mode
fi
echo "Using theme mode: $CURRENT_MODE"


if [[ -f $1 ]] ; then
    echo Setting wallpaper and auto generating colors for image: "$1"
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$1"
    hyprctl hyprpaper wallpaper ,"$1"
    matugen image "$1" -m "$CURRENT_MODE" --show-colors
    gsettings set org.gnome.desktop.interface color-scheme "prefer-$CURRENT_MODE"
    
else
    echo "Failed to find wallpaper."
    echo "Exiting..."
    exit 1
fi
