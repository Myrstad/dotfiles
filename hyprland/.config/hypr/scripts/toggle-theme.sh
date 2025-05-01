#!/bin/bash

THEME_FILE="$HOME/.config/hypr/theme"
WALLPAPER_PATH=$(hyprctl hyprpaper listloaded)

# If THEME_FILE exists (default theme is dark) change contents to light if dark and vice verca
if [[ -f "$THEME_FILE" ]]; then
    CURRENT_MODE=$(cat "$THEME_FILE")
    if [[ "$CURRENT_MODE" == "dark" ]]; then
        echo "Switching to light mode"
        echo "light" > "$THEME_FILE"
        gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
        matugen image "$WALLPAPER_PATH" -m light --show-colors
    else
        echo "Switching to dark mode"
        echo "dark" > "$THEME_FILE"
        gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
        matugen image "$WALLPAPER_PATH" -m dark --show-colors
    fi
else
    echo "Theme file not found. Creating default theme file with dark mode."
    echo "dark" > "$THEME_FILE"
fi