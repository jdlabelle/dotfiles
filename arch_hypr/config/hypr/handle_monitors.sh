#!/bin/bash

# This is currently buggy / doesn't work as intended

handle() {
    case $1 in
	monitoradded*)
        hyprctl --batch "\
            keyword monitor eDP-1, disable ; \
            keyword monitor HDMI-A-1, 2560x1440@59.95, 0x0, 1 ; \
            keyword monitor DP-2, 1920x1080@60, 2560x-25, 1, transform, 1 ; \
            keyword workspace 1, monitor:HDMI-A-1, default"
	    ;;

	monitorremoved*)
        hyprctl --batch "\
            keyword monitor eDP-1, preferred, auto, 1 ; \
            keyword monitor HDMI-A-1, disable ; \
            keyword monitor DP-2, disable ; \
            dispatch moveworkspacetomonitor 1 eDP-1"
	    ;;
    esac
}

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | \
    while read -r line; do handle "$line"; done
