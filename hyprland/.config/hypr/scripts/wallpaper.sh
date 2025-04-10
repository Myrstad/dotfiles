#!/bin/bash


if [[ -f $1 ]] ; then
    echo Setting wallpaper and auto generating colors for image: "$1"
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$1"
    hyprctl hyprpaper wallpaper ,"$1"
    matugen image "$1" --show-colors
    
else
    echo "Failed to find wallpaper."
    echo "Exiting..."
    exit 1
fi
