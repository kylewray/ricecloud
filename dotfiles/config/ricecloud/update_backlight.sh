#!/bin/bash

CUR_BRIGHTNESS=`cat /sys/class/backlight/intel_backlight/brightness`
MAX_BRIGHTNESS=`cat /sys/class/backlight/intel_backlight/max_brightness`
NEW_BRIGHTNESS=$CUR_BRIGHTNESS

#echo "Current: $CUR_BRIGHTNESS"
#echo "Max: $MAX_BRIGHTNESS"

if [ $# -eq 2 ]; then
    PERCENTAGE=$2
    DESIRED_AMOUNT=`python -c "x = $PERCENTAGE / 100.0 * $MAX_BRIGHTNESS; print(x)"`
    #echo "Percentage: $PERCENTAGE"
    #echo "Desired Amount: $DESIRED_AMOUNT"

    if [ "$1" == "+" ]; then
        NEW_BRIGHTNESS=`python -c "x = min($MAX_BRIGHTNESS - 1, $CUR_BRIGHTNESS + $DESIRED_AMOUNT); print(int(x))"`
        #echo "Increase to $NEW_BRIGHTNESS"
    elif [ "$1" == "-" ]; then
        NEW_BRIGHTNESS=`python -c "x = max(1, $CUR_BRIGHTNESS - $DESIRED_AMOUNT); print(int(x))"`
        #echo "Decrease to $NEW_BRIGHTNESS"
    fi
elif [ $# -eq 1 ]; then
    DESIRED_BRIGHTNESS=`python -c "x = $1 / 100.0 * $MAX_BRIGHTNESS; print(x)"`
    NEW_BRIGHTNESS=`python -c "x = max(1, min($MAX_BRIGHTNESS - 1, $DESIRED_BRIGHTNESS)); print(int(x))"`
    #echo "Set to $NEW_BRIGHTNESS"
fi

#echo "New Brightness: $NEW_BRIGHTNESS"
echo "$NEW_BRIGHTNESS" > /sys/class/backlight/intel_backlight/brightness

