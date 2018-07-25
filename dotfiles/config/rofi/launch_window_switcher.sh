#!/bin/sh

killall -q rofi

while pgrep -u $UID -x "rofi" >/dev/null; do sleep 1; done

rofi -show window -lines 5 -columns 1 -width 600 -padding 20 -dpi 96 &

