#!/bin/sh

killall -q rofi

while pgrep -u $UID -x "rofi" >/dev/null; do sleep 1; done

rofi -show run -lines 3 -width 512 -padding 20 -dpi 96 &

