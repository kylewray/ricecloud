#!/bin/bash

export RICECLOUD_ROOT=$HOME/development/ricecloud/dotfiles
export RICECLOUD_CONFIG=$RICECLOUD_ROOT/config

# ----------------------------------------------------------------
# Basic Color Scheme
# ----------------------------------------------------------------
# font
export RICECLOUD_GUI_FONT="Source Sans Pro"
export RICECLOUD_GUI_FONT_SIZE="14"
export RICECLOUD_TERMINAL_FONT="Source Code Pro"
export RICECLOUD_TERMINAL_FONT_SIZE="12"

# opacity/transparency
export RICECLOUD_COLOR_OPACITY=100
export RICECLOUD_COLOR_TRANSPARENCY=0

# background/foreground
export RICECLOUD_COLOR_FOREGROUND=#ccced1
export RICECLOUD_COLOR_CURSOR=#ccced1
export RICECLOUD_COLOR_BACKGROUND=#1a1c1e

# black
export RICECLOUD_COLOR_0=#282a2e
export RICECLOUD_COLOR_8=#40464f

# red
export RICECLOUD_COLOR_1=#a53f3f
export RICECLOUD_COLOR_9=#db6f6f

# green
export RICECLOUD_COLOR_2=#878d50
export RICECLOUD_COLOR_10=#c2cc68

# yellow
export RICECLOUD_COLOR_3=#c29252
export RICECLOUD_COLOR_11=#efc87a

# blue
export RICECLOUD_COLOR_4=#537693
export RICECLOUD_COLOR_12=#8cafcc

# magenta
export RICECLOUD_COLOR_5=#7d6485
export RICECLOUD_COLOR_13=#b697bf

# cyan
export RICECLOUD_COLOR_6=#5b8681
export RICECLOUD_COLOR_14=#8fc6be

# white
export RICECLOUD_COLOR_7=#6c7782
export RICECLOUD_COLOR_15=#ccced1

# custom descriptors
export RICECLOUD_COLOR_TEXT=$RICECLOUD_COLOR_15
export RICECLOUD_COLOR_HIGHLIGHT=$RICECLOUD_COLOR_10
export RICECLOUD_COLOR_ACCENT=$RICECLOUD_COLOR_12
export RICECLOUD_COLOR_WARNING=$RICECLOUD_COLOR_9
# ----------------------------------------------------------------

## ----------------------------------------------------------------
## Nature Color Scheme
## ----------------------------------------------------------------
## font
#export RICECLOUD_GUI_FONT="Exo"
#export RICECLOUD_GUI_FONT_SIZE="12"
#export RICECLOUD_TERMINAL_FONT="Inconsolata"
#export RICECLOUD_TERMINAL_FONT_SIZE="12"
#
## opacity/transparency
#export RICECLOUD_COLOR_OPACITY=100
#export RICECLOUD_COLOR_TRANSPARENCY=0
#
## background/foreground
#export RICECLOUD_COLOR_FOREGROUND=#ccced1
#export RICECLOUD_COLOR_CURSOR=#ccced1
#export RICECLOUD_COLOR_BACKGROUND=#1a1c1e
#
## black
#export RICECLOUD_COLOR_0=#282a2e
#export RICECLOUD_COLOR_8=#40464f
#
## red
#export RICECLOUD_COLOR_1=#aa4213
#export RICECLOUD_COLOR_9=#dc5518
#
## green
#export RICECLOUD_COLOR_2=#a4a53c
#export RICECLOUD_COLOR_10=#d5d74e
#
## yellow
#export RICECLOUD_COLOR_3=#a69e17
#export RICECLOUD_COLOR_11=#d8cd1d
#
## blue
#export RICECLOUD_COLOR_4=#4d83a8
#export RICECLOUD_COLOR_12=#4d83a8
#
## magenta
#export RICECLOUD_COLOR_5=#ad741e
#export RICECLOUD_COLOR_13=#df9526
#
## cyan
#export RICECLOUD_COLOR_6=#8da931
#export RICECLOUD_COLOR_14=#b6db3f
#
## white
#export RICECLOUD_COLOR_7=#9ba6a4
#export RICECLOUD_COLOR_15=#c9d8d5
#
## custom descriptors
#export RICECLOUD_COLOR_TEXT=$RICECLOUD_COLOR_15
#export RICECLOUD_COLOR_HIGHLIGHT=$RICECLOUD_COLOR_10
#export RICECLOUD_COLOR_ACCENT=$RICECLOUD_COLOR_12
#export RICECLOUD_COLOR_WARNING=$RICECLOUD_COLOR_9
## ----------------------------------------------------------------


# vim -- uses terminal color scheme

# pantheon terminal
gsettings set io.elementary.terminal.settings font "${RICECLOUD_TERMINAL_FONT} ${RICECLOUD_TERMINAL_FONT_SIZE}"
gsettings set io.elementary.terminal.settings background "${RICECLOUD_COLOR_BACKGROUND}"
gsettings set io.elementary.terminal.settings foreground "${RICECLOUD_COLOR_FOREGROUND}"
gsettings set io.elementary.terminal.settings cursor-color "${RICECLOUD_COLOR_CURSOR}"
gsettings set io.elementary.terminal.settings palette "${RICECLOUD_COLOR_0}:${RICECLOUD_COLOR_1}:${RICECLOUD_COLOR_2}:${RICECLOUD_COLOR_3}:${RICECLOUD_COLOR_4}:${RICECLOUD_COLOR_5}:${RICECLOUD_COLOR_6}:${RICECLOUD_COLOR_7}:${RICECLOUD_COLOR_8}:${RICECLOUD_COLOR_9}:${RICECLOUD_COLOR_10}:${RICECLOUD_COLOR_11}:${RICECLOUD_COLOR_12}:${RICECLOUD_COLOR_13}:${RICECLOUD_COLOR_14}:${RICECLOUD_COLOR_15}"


# termite
sed -i -e "s/font=.*/font=${RICECLOUD_TERMINAL_FONT} ${RICECLOUD_TERMINAL_FONT_SIZE}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/foreground .*/foreground = ${RICECLOUD_COLOR_FOREGROUND}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/foreground_bold .*/foreground_bold = ${RICECLOUD_COLOR_FOREGROUND}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/cursor .*/cursor = ${RICECLOUD_COLOR_FOREGROUND}/g" $RICECLOUD_CONFIG/termite/config
BACKGROUND=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_BACKGROUND"]; opacity=float(os.environ["RICECLOUD_COLOR_OPACITY"]) / 100.0; print("rgba(%i, %i, %i, %.2f)" % (int(color[1:3], 16), int(color[3:5], 16), int(color[5:7], 16), opacity))'`
sed -i -e "s/background .*/background = ${BACKGROUND}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color0 .*/color0 = ${RICECLOUD_COLOR_0}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color1 .*/color1 = ${RICECLOUD_COLOR_1}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color2 .*/color2 = ${RICECLOUD_COLOR_2}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color3 .*/color3 = ${RICECLOUD_COLOR_3}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color4 .*/color4 = ${RICECLOUD_COLOR_4}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color5 .*/color5 = ${RICECLOUD_COLOR_5}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color6 .*/color6 = ${RICECLOUD_COLOR_6}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color7 .*/color7 = ${RICECLOUD_COLOR_7}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color8 .*/color8 = ${RICECLOUD_COLOR_8}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color9 .*/color9 = ${RICECLOUD_COLOR_9}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color10 .*/color10 = ${RICECLOUD_COLOR_10}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color11 .*/color11 = ${RICECLOUD_COLOR_11}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color12 .*/color12 = ${RICECLOUD_COLOR_12}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color13 .*/color13 = ${RICECLOUD_COLOR_13}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color14 .*/color14 = ${RICECLOUD_COLOR_14}/g" $RICECLOUD_CONFIG/termite/config
sed -i -e "s/color15 .*/color15 = ${RICECLOUD_COLOR_15}/g" $RICECLOUD_CONFIG/termite/config

# Xresources
sed -i -e "s/foreground.*/foreground: ${RICECLOUD_COLOR_FOREGROUND}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/background.*/background: ${RICECLOUD_COLOR_BACKGROUND}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/cursorColor.*/cursorColor: ${RICECLOUD_COLOR_CURSOR}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color0.*/color0: ${RICECLOUD_COLOR_0}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color1.*/color1: ${RICECLOUD_COLOR_1}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color2.*/color2: ${RICECLOUD_COLOR_2}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color3.*/color3: ${RICECLOUD_COLOR_3}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color4.*/color4: ${RICECLOUD_COLOR_4}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color5.*/color5: ${RICECLOUD_COLOR_5}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color6.*/color6: ${RICECLOUD_COLOR_6}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color7.*/color7: ${RICECLOUD_COLOR_7}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color8.*/color8: ${RICECLOUD_COLOR_8}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color9.*/color9: ${RICECLOUD_COLOR_9}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color10.*/color10: ${RICECLOUD_COLOR_10}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color11.*/color11: ${RICECLOUD_COLOR_11}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color12.*/color12: ${RICECLOUD_COLOR_12}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color13.*/color13: ${RICECLOUD_COLOR_13}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color14.*/color14: ${RICECLOUD_COLOR_14}/g" $RICECLOUD_ROOT/Xresources
sed -i -e "s/color15.*/color15: ${RICECLOUD_COLOR_15}/g" $RICECLOUD_ROOT/Xresources

# openbox
#OPENBOX_BORDER=$RICECLOUD_COLOR_BACKGROUND
#OPENBOX_ACTIVE=$RICECLOUD_COLOR_12
#OPENBOX_ACTIVE_BUTTON=$RICECLOUD_COLOR_4
#OPENBOX_INACTIVE=$RICECLOUD_COLOR_4
#OPENBOX_INACTIVE_BUTTON=$RICECLOUD_COLOR_12
OPENBOX_BORDER=$RICECLOUD_COLOR_0
OPENBOX_ACTIVE=$RICECLOUD_COLOR_BACKGROUND
OPENBOX_ACTIVE_BUTTON=$RICECLOUD_COLOR_4
OPENBOX_INACTIVE=$RICECLOUD_COLOR_BACKGROUND
OPENBOX_INACTIVE_BUTTON=$RICECLOUD_COLOR_12
sed -i -e "s/window.active.border.color: .*/window.active.border.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.border.color: .*/window.inactive.border.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.frameColor: .*/window.frameColor: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.*.client.color: .*/window.*.client.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/menu.border.color: .*/menu.border.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/menu.items.bg.color: .*/menu.items.bg.color: ${OPENBOX_INACTIVE}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/menu.items.active.bg.color: .*/menu.items.active.bg.color: ${OPENBOX_ACTIVE}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/menu.items.disabled.text.color: .*/menu.items.disabled.text.color: ${OPENBOX_INACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/menu.items.active.text.color: .*/menu.items.active.text.color: ${OPENBOX_ACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.title.bg.color: .*/window.active.title.bg.color: ${OPENBOX_ACTIVE}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.title.separator.color: .*/window.active.title.separator.color: ${OPENBOX_ACTIVE}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.*.bg.border.color: .*/window.active.*.bg.border.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.label.text.color: .*/window.active.label.text.color: ${OPENBOX_ACTIVE}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.button.*.image.color: .*/window.active.button.*.image.color: ${OPENBOX_ACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.button.*.bg.border.color: .*/window.active.button.*.bg.border.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.button.pressed.bg.color: .*/window.active.button.pressed.bg.color: ${OPENBOX_ACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.button.pressed.bg.border.color: .*/window.active.button.pressed.bg.border.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.button.pressed.image.color: .*/window.active.button.pressed.image.color: ${OPENBOX_ACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.button.hover.bg.color: .*/window.active.button.hover.bg.color: ${OPENBOX_ACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.button.hover.bg.border.color: .*/window.active.button.hover.bg.border.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.button.hover.image.color: .*/window.active.button.hover.image.color: ${OPENBOX_ACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.button.disabled.image.color: .*/window.active.button.disabled.image.color: ${OPENBOX_ACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.handle.bg.color: .*/window.active.handle.bg.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.active.grip.bg.color: .*/window.active.grip.bg.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.title.bg.color: .*/window.inactive.title.bg.color: ${OPENBOX_INACTIVE}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.title.separator.color: .*/window.inactive.title.separator.color: ${OPENBOX_INACTIVE}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.*.border.color: .*/window.inactive.*.border.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.label.text.color: .*/window.inactive.label.text.color: ${OPENBOX_INACTIVE}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.button.*.image.color: .*/window.inactive.button.*.image.color: ${OPENBOX_INACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.button.*.bg.border.color: .*/window.inactive.button.*.bg.border.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.button.pressed.bg.color: .*/window.inactive.button.pressed.bg.color: ${OPENBOX_INACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.button.pressed.bg.border.color: .*/window.inactive.button.pressed.bg.border.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.button.pressed.image.color: .*/window.inactive.button.pressed.image.color: ${OPENBOX_INACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.button.hover.bg.color: .*/window.inactive.button.hover.bg.color: ${OPENBOX_INACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.button.hover.bg.border.color: .*/window.inactive.button.hover.bg.border.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.button.hover.image.color: .*/window.inactive.button.hover.image.color: ${OPENBOX_INACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.button.disabled.image.color: .*/window.inactive.button.disabled.image.color: ${OPENBOX_INACTIVE_BUTTON}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.handle.bg.color: .*/window.inactive.handle.bg.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc
sed -i -e "s/window.inactive.grip.bg.color: .*/window.inactive.grip.bg.color: ${OPENBOX_BORDER}/g" $RICECLOUD_CONFIG/openbox/theme/themerc

# rofi
export ROFI_OPACITY=100
#ROFI_BACKGROUND=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_BACKGROUND"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s".format(opacity, 2) % (color))'`
#ROFI_FOREGROUND=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_HIGHLIGHT"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s".format(opacity, 2) % (color))'`
#ROFI_NORMAL=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_TEXT"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s".format(opacity, 2) % (color))'`
#ROFI_ACTIVE=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_ACCENT"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s".format(opacity, 2) % (color))'`
#ROFI_URGENT=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_WARNING"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s".format(opacity, 2) % (color))'`
# Note: rofi has two awesome bugs. First, opacity is messed up. It is
# higher opacity for the boxes. Second, the colors go ABGR instead of ARGB.
# This is a known bug, hopefully fixed soon... Once the opacity is fixed,
# replace ROFI_OPACITY in the 5 lines below with RICECLOUD_COLOR_OPACITY.
# This code below flips the colors to be ABGR... Remove when fixed.
ROFI_BACKGROUND=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_BACKGROUND"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s%s%s".format(opacity, 2) % (color[4:6], color[2:4], color[0:2]))'`
ROFI_FOREGROUND=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_HIGHLIGHT"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s%s%s".format(opacity, 2) % (color[4:6], color[2:4], color[0:2]))'`
ROFI_NORMAL=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_TEXT"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s%s%s".format(opacity, 2) % (color[4:6], color[2:4], color[0:2]))'`
ROFI_ACTIVE=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_ACCENT"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s%s%s".format(opacity, 2) % (color[4:6], color[2:4], color[0:2]))'`
ROFI_URGENT=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_WARNING"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s%s%s".format(opacity, 2) % (color[4:6], color[2:4], color[0:2]))'`
sed -i -e "s/rofi.font:.*/rofi.font: ${RICECLOUD_GUI_FONT} ${RICECLOUD_GUI_FONT_SIZE}/g" $RICECLOUD_CONFIG/rofi/config
sed -i -e "s/rofi.color-window:.*/rofi.color-window: ${ROFI_BACKGROUND}, ${ROFI_BACKGROUND}, ${ROFI_BACKGROUND}/g" $RICECLOUD_CONFIG/rofi/config
sed -i -e "s/rofi.color-normal:.*/rofi.color-normal: ${ROFI_BACKGROUND}, ${ROFI_NORMAL}, ${ROFI_BACKGROUND}, ${ROFI_FOREGROUND}, ${ROFI_BACKGROUND}/g" $RICECLOUD_CONFIG/rofi/config
sed -i -e "s/rofi.color-active:.*/rofi.color-active: ${ROFI_BACKGROUND}, ${ROFI_ACTIVE}, ${ROFI_BACKGROUND}, ${ROFI_FOREGROUND}, ${ROFI_BACKGROUND}/g" $RICECLOUD_CONFIG/rofi/config
sed -i -e "s/rofi.color-urgent:.*/rofi.color-urgent: ${ROFI_BACKGROUND}, ${ROFI_URGENT}, ${ROFI_BACKGROUND}, ${ROFI_FOREGROUND}, ${ROFI_BACKGROUND}/g" $RICECLOUD_CONFIG/rofi/config

# oblogout
sed -i -e "s/opacity .*/opacity = ${RICECLOUD_COLOR_OPACITY}/g" $RICECLOUD_CONFIG/oblogout/config
#sed -i -e "s/bgcolor .*/bgcolor = ${RICECLOUD_COLOR_BACKGROUND}/g" $RICECLOUD_CONFIG/oblogout/config
sed -i -e "s/bgcolor .*/bgcolor = black/g" $RICECLOUD_CONFIG/oblogout/config

# polybar
# Note: Polybar has one small bug, I think. It could be with compton perhaps. Anyway, full transparency does not work. However,
# any semi-transparency works perfectly. Thus, the background below is slightly opaque. Make it full when they fix this.
export POLYBAR_OPACITY=100
POLYBAR_BACKGROUND=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_BACKGROUND"][1:]; opacity=int(float(os.environ["POLYBAR_OPACITY"]) * 2.55); print("#{0:0{1}x}%s".format(opacity, 2) % (color))'`
sed -i -e "s/font-0 = .*/font-0 = ${RICECLOUD_GUI_FONT}:pixelsize=${RICECLOUD_GUI_FONT_SIZE}\;0/g" $RICECLOUD_CONFIG/polybar/config
sed -i -e "s/font-1 = .*/font-1 = FontAwesome:pixelsize=${RICECLOUD_GUI_FONT_SIZE}\;0/g" $RICECLOUD_CONFIG/polybar/config
sed -i -e "s/ricecloud-background .*/ricecloud-background = ${POLYBAR_BACKGROUND}/g" $RICECLOUD_CONFIG/polybar/config
sed -i -e "s/ricecloud-foreground .*/ricecloud-foreground = ${RICECLOUD_COLOR_FOREGROUND}/g" $RICECLOUD_CONFIG/polybar/config
sed -i -e "s/ricecloud-text .*/ricecloud-text = ${RICECLOUD_COLOR_TEXT}/g" $RICECLOUD_CONFIG/polybar/config
sed -i -e "s/ricecloud-highlight .*/ricecloud-highlight = ${RICECLOUD_COLOR_HIGHLIGHT}/g" $RICECLOUD_CONFIG/polybar/config
sed -i -e "s/ricecloud-accent .*/ricecloud-accent = ${RICECLOUD_COLOR_ACCENT}/g" $RICECLOUD_CONFIG/polybar/config
sed -i -e "s/ricecloud-warning .*/ricecloud-warning = ${RICECLOUD_COLOR_WARNING}/g" $RICECLOUD_CONFIG/polybar/config

# dunst
sed -i -e "s/font = .*/font = ${RICECLOUD_GUI_FONT} ${RICECLOUD_GUI_FONT_SIZE}/g" $RICECLOUD_CONFIG/dunst/config
sed -i -e "s/transparency = .*/transparency = ${RICECLOUD_COLOR_TRANSPARENCY}/g" $RICECLOUD_CONFIG/dunst/config
sed -i -e "s/frame_color = .*/frame_color = \"${RICECLOUD_COLOR_0}\"/g" $RICECLOUD_CONFIG/dunst/config
sed -i -e "s/separator_color = .*/separator_color = \"${RICECLOUD_COLOR_0}\"/g" $RICECLOUD_CONFIG/dunst/config
sed -i -e "/\[urgency_low\]/{n;s/background = .*/background = \"${RICECLOUD_COLOR_BACKGROUND}\"/g;n;s/foreground = .*/foreground = \"${RICECLOUD_COLOR_ACCENT}\"/g}" $RICECLOUD_CONFIG/dunst/config
sed -i -e "/\[urgency_normal\]/{n;s/background = .*/background = \"${RICECLOUD_COLOR_BACKGROUND}\"/g;n;s/foreground = .*/foreground = \"${RICECLOUD_COLOR_TEXT}\"/g}" $RICECLOUD_CONFIG/dunst/config
sed -i -e "/\[urgency_critical\]/{n;s/background = .*/background = \"${RICECLOUD_COLOR_BACKGROUND}\"/g;n;s/foreground = .*/foreground = \"${RICECLOUD_COLOR_WARNING}\"/g}" $RICECLOUD_CONFIG/dunst/config

# cava
sed -i -e "s/background = .*/background = '${RICECLOUD_COLOR_BACKGROUND}'/g" $RICECLOUD_CONFIG/cava/config
sed -i -e "s/gradient_color_1 = .*/gradient_color_1 = '${RICECLOUD_COLOR_ACCENT}'/g" $RICECLOUD_CONFIG/cava/config
sed -i -e "s/gradient_color_2 = .*/gradient_color_2 = '${RICECLOUD_COLOR_TEXT}'/g" $RICECLOUD_CONFIG/cava/config


