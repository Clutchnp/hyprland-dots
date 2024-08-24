#!/bin/bash
# GameMode script stolen from JaKooLit 
notif="$HOME/.config/swaync/images/bell.png"
SCRIPTSDIR="$HOME/.config/hypr/scripts"


HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:passes 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    notify-send -e -u low -i "$notif" "gamemode enabled. All animations off"
    exit
else
    notify-send -e -u normal -i "$notif" "gamemode disabled. All animations normal"
fi
hyprctl reload
