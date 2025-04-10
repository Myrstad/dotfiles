#!/bin/bash

choice=$("$HOME/.config/hypr/scripts/getwalls.sh" | rofi -dmenu -p "Wallpaper" -select "firewatch" -i -config ~/.config/rofi/wallpicker.rasi)

"$HOME/.config/hypr/scripts/wallpaper.sh" "$choice"