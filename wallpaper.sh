#!/bin/bash
wallpaper=$(find ~/.config/hypr/Wallpapers/ -type f | shuf --random-source=/dev/urandom -n 1)
echo $wallpaper
echo -ne "preload = $wallpaper \n wallpaper = ,$wallpaper" > ~/.config/hypr/hyprpaper.conf
hyprpaper
