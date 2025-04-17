#!/bin/bash
# GameMode script stolen from JaKooLit 
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
        keyword decoration:rounding 0;" 

    hyprctl output remove sunshine1 &\
    ssh oldlappy pkill -f moonlight.AppImage &\
    pkill -f sunshine.AppImage &\
    pkill -f sunshine &\
    notify-send -e -u low -i "$notif" "gamemode enabled. All animations off" &\
    exit
else

    hyprctl  output create headless sunshine1 &\
    ~/SPACE/build/sunshine.AppImage &\
    ssh oldlappy 'DISPLAY=:0 QT_QPA_PLATFORM=xcb /home/clutch/Downloads/moonlight.AppImage stream clutchrig Desktop &' &\
    hyprctl reload &\
    notify-send -e -u normal -i "$notif" "gamemode disabled. All animations normal" &\
fi
hyprctl reload
