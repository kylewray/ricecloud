#!/bin/sh

killall -q rofi
while pgrep -u $UID -x "rofi" >/dev/null; do sleep 1; done

BLURSCREEN="/tmp/ricecloud_blurscreen.png"

# Take a screenshot and save it to the tmp directory.
scrot $BLURSCREEN

# Scale down to 0.4 size, then scale back up by 2.5=1.0/0.4. Finally, blur.
convert $BLURSCREEN -scale 20% -scale 500% -blur 16x16 $BLURSCREEN

# Show the screenshot in the background and get the process id.
feh -F $BLURSCREEN &
FEHPID=$!

# Run rofi!
rofi -show run -lines 5 -columns 3 -width 600 -padding 20 -dpi 96

# Kill feh image whenever oblogout terminates.
kill -15 $FEHPID

# Remove the blurred screen image.
rm $BLURSCREEN


