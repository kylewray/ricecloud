#!/bin/bash

BLURSCREEN="/tmp/ricecloud_blurscreen.png"

# Take a screenshot and save it to the tmp directory.
scrot $BLURSCREEN

# Scale down to 0.4 size, then scale back up by 2.5=1.0/0.4. Finally, blur.
convert $BLURSCREEN -scale 20% -scale 500% -blur 16x16 $BLURSCREEN

# Setup variables for the lock screen.
SCREENWIDTH=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)

FONT="Source Sans Pro"
FONTSIZE=18
FONTCOLOR=ccced1ff

BARSIZE=3
TYPECOLOR=282a2eff
BACKSPACECOLOR=282a2eff

VERIFCOLOR=8cafccff
WRONGCOLOR=db6f6fff

# Run i3lock!
i3lock -i /tmp/ricecloud_blurscreen.png --clock \ #--indpos="x+100:y+100" \
    --timestr="%H:%M:%S" --time-font=$FONT --timesize=$FONTSIZE --timecolor=$FONTCOLOR \
    --datestr="%A, %m %Y" --date-font=$FONT --datesize=$FONTSIZE --datecolor=$FONTCOLOR \
    --bar-indicator --bar-width=$SCREENWIDTH --bar-base-width=$BARSIZE \
        --bar-max-height=$BARSIZE --bar-step=$BARSIZE --bar-periodic-step=$BARSIZE \
        --bar-color=$TYPECOLOR --keyhlcolor=$TYPECOLOR --bshlcolor=$BACKSPACECOLOR \
        --ringvercolor=$VERIFCOLOR --ringwrongcolor=$WRONGCOLOR \
    --veriftext="Verifying" --verifsize=$FONTSIZE --verif-font=$FONT --verifcolor=$VERIFCOLOR \
    --wrongtext="Incorrect" --wrongsize=$FONTSIZE --wrong-font=$FONT --wrongcolor=$WRONGCOLOR \
    --noinputtext="Input Cleared" --locktext="Locking" --lockfailedtext="Lock Failed"

# Remove the blurred screen image.
rm $BLURSCREEN

