#!/bin/sh
Sleep=300
swaybg -i $(find ~/.config/Wallpaper/. -type f | shuf -n1) -m fill &
OLD_PID=$!
while true; do
    sleep $Sleep
    swaybg -i $(find ~/.config/Wallpaper/. -type f | shuf -n1) -m fill &
    sleep 5
    NEXT_PID=$!
    kill $OLD_PID
    OLD_PID=$NEXT_PID
done
