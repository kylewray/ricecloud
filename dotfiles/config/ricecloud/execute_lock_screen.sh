#!/bin/bash

BLUR_SCREEN="/tmp/ricecloud_blur_screen.png"

# Take a screenshot and save it to the tmp directory.
scrot $BLUR_SCREEN

# Scale down 25%, then blur the image a bit, then scale back up to fill.
convert $BLUR_SCREEN -scale 25% -blur 4x4 -scale 400% $BLUR_SCREEN

# Setup variables for the lock screen.
SCREEN_WIDTH=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)

FONT=Source Sans Pro
FONT_SIZE=22
FONT_COLOR=#ccced1ff

BAR_SIZE=3
TYPE_COLOR=#282a2eff
BACKSPACE_COLOR=#8cafccff

VERIFY_COLOR=#8cafccff
WRONG_COLOR=#db6f6fff

# Run i3lock!
i3lock -i $BLUR_SCREEN --clock \
    --timestr="%l:%M %p" --time-font=$FONT --timesize=$FONT_SIZE --timecolor=$FONT_COLOR \
    --datestr="%a %b %d %Y" --date-font=$FONT --datesize=$FONT_SIZE --datecolor=$FONT_COLOR \
    --bar-indicator --bar-width=$SCREEN_WIDTH --bar-base-width=$BAR_SIZE \
        --bar-max-height=$BAR_SIZE --bar-step=$BAR_SIZE --bar-periodic-step=$BAR_SIZE \
        --bar-color=$TYPE_COLOR --keyhlcolor=$TYPE_COLOR --bshlcolor=$BACKSPACE_COLOR \
        --ringvercolor=$VERIFY_COLOR --ringwrongcolor=$WRONG_COLOR \
    --veriftext="Verifying" --verifsize=$FONT_SIZE --verif-font=$FONT --verifcolor=$VERIFY_COLOR \
    --wrongtext="Incorrect" --wrongsize=$FONT_SIZE --wrong-font=$FONT --wrongcolor=$WRONG_COLOR \
    --noinputtext="Input Cleared" --locktext="Locking" --lockfailedtext="Lock Failed"

# Remove the blurred screen image.
rm $BLUR_SCREEN

