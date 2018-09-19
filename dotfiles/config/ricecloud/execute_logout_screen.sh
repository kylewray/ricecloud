#!/bin/sh

killall -q oblogout
while pgrep -u $UID -x "oblogout" >/dev/null; do sleep 1; done

BLURSCREEN="/tmp/ricecloud_blurscreen.png"

# Take a screenshot and save it to the tmp directory.
scrot $BLURSCREEN

# Scale down to 0.4 size, then scale back up by 2.5=1.0/0.4. Finally, blur.
convert $BLURSCREEN -scale 20% -scale 500% -blur 16x16 $BLURSCREEN

# Show the screenshot in the background and get the process id.
feh -F $BLURSCREEN &
FEHPID=$!

# Run oblogout!
oblogout --config $HOME/.config/oblogout/config

# Kill feh image whenever oblogout terminates.
kill -15 $FEHPID

# Remove the blurred screen image.
rm $BLURSCREEN

