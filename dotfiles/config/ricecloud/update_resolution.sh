#!/bin/bash

# Update the resolution and the displays.
xrandr --output ${1} --mode ${3}x${4} --rate ${5} --primary --output ${2} --off

# Now kill all processes we need to restart.
killall polybar

# Update the wallpaper, since the resolution likely changed.
nitrogen --restore

# After all updates, we pause a second to let everything close and update.
sleep 1

# Note: "&" launches a child process, and "setsid" detaches it from the controlling
# tty. Then "(...)" in bash starts a grandchild process. When the child process dies,
# the grandchild is inherited by init. This convenient syntactic technique is only
# usable in bash.

# Finally, we fork all the new processes we needed to relaunch.
# This includes the polybar, since it needs to know the new dimensions and window.
(setsid polybar ricecloud &)

exit 0

