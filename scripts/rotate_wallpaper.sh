#!/bin/bash

# This script is meant to be used in conjuction with a cronjob to automatically
# rotate your wallpaper at whatever interval you want to set.
# Open your crontab with `crontab -e`

# select a random wallpaper from the directory
RANDOM_FILE=$(ls /home/josh/Pictures/wallpapers/ | xargs shuf -e | head -n1)

# set environment variable so cron can run the command correctly
# cron has a very restricted set of ENV vars that it uses, so alot of times
# you have to explicitly set them.
PID=$(pgrep gnome-session | head -n1)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

# run the command to change the background wallpaper
gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/josh/Pictures/wallpapers/$RANDOM_FILE"
