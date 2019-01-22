#!/bin/sh

killall -q rofi
while pgrep -u $UID -x "rofi" >/dev/null; do sleep 1; done

BLUR_SCREEN="/tmp/ricecloud_blur_screen.png"

# Take a screenshot and save it to the tmp directory.
scrot $BLUR_SCREEN

# Scale down 25% then blur the image a bit. This is really fast.
convert $BLUR_SCREEN -scale 25% -blur 4x4 $BLUR_SCREEN

# Show the screenshot in the background and get the process id.
feh -F -Z $BLUR_SCREEN &
FEHPID=$!

# Run rofi!
rofi -show window -lines 5 -columns 1 -width 600 -padding 20 -dpi 96 &

# Kill feh image whenever oblogout terminates.
kill -15 $FEHPID

# Remove the blurred screen image.
rm $BLUR_SCREEN

