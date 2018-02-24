#!/bin/bash

# Update the resolution and the displays.
xrandr --output ${1} --mode ${3}x${4} --rate ${5} --primary --output ${2} --off

# Note: "&" launches a child process, and "disown" essentially starts a grandchild
# process for this shell script. When the child process dies, the grandchild is
# inherited by init. This convenient syntactic technique is only usable in bash.

# Update the wallpaper, since the resolution likely changed.
#killall nitrogen
#disown -h `nitrogen --restore` &
nitrogen --restore &

# Update the polybar, since it needs to know the new dimensions and window.
killall polybar
disown -h `polybar ricecloud` &

# TODO: Figure out why this works and "exit 0" does not...
killall update_resolution.sh

exit 0

