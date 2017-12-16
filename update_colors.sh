#!/bin/bash

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


# vim -- uses terminal color scheme

# termite
sed -i -e "s/font=.*/font=${RICECLOUD_TERMINAL_FONT} ${RICECLOUD_TERMINAL_FONT_SIZE}/g" dotfiles/config/termite/config
sed -i -e "s/foreground .*/foreground = ${RICECLOUD_COLOR_FOREGROUND}/g" dotfiles/config/termite/config
sed -i -e "s/foreground_bold .*/foreground_bold = ${RICECLOUD_COLOR_FOREGROUND}/g" dotfiles/config/termite/config
sed -i -e "s/cursor .*/cursor = ${RICECLOUD_COLOR_FOREGROUND}/g" dotfiles/config/termite/config
BACKGROUND=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_BACKGROUND"]; opacity=float(os.environ["RICECLOUD_COLOR_OPACITY"]) / 100.0; print("rgba(%i, %i, %i, %.2f)" % (int(color[1:3], 16), int(color[3:5], 16), int(color[5:7], 16), opacity))'`
sed -i -e "s/background .*/background = ${BACKGROUND}/g" dotfiles/config/termite/config
sed -i -e "s/color0 .*/color0 = ${RICECLOUD_COLOR_0}/g" dotfiles/config/termite/config
sed -i -e "s/color1 .*/color1 = ${RICECLOUD_COLOR_1}/g" dotfiles/config/termite/config
sed -i -e "s/color2 .*/color2 = ${RICECLOUD_COLOR_2}/g" dotfiles/config/termite/config
sed -i -e "s/color3 .*/color3 = ${RICECLOUD_COLOR_3}/g" dotfiles/config/termite/config
sed -i -e "s/color4 .*/color4 = ${RICECLOUD_COLOR_4}/g" dotfiles/config/termite/config
sed -i -e "s/color5 .*/color5 = ${RICECLOUD_COLOR_5}/g" dotfiles/config/termite/config
sed -i -e "s/color6 .*/color6 = ${RICECLOUD_COLOR_6}/g" dotfiles/config/termite/config
sed -i -e "s/color7 .*/color7 = ${RICECLOUD_COLOR_7}/g" dotfiles/config/termite/config
sed -i -e "s/color8 .*/color8 = ${RICECLOUD_COLOR_8}/g" dotfiles/config/termite/config
sed -i -e "s/color9 .*/color9 = ${RICECLOUD_COLOR_9}/g" dotfiles/config/termite/config
sed -i -e "s/color10 .*/color10 = ${RICECLOUD_COLOR_10}/g" dotfiles/config/termite/config
sed -i -e "s/color11 .*/color11 = ${RICECLOUD_COLOR_11}/g" dotfiles/config/termite/config
sed -i -e "s/color12 .*/color12 = ${RICECLOUD_COLOR_12}/g" dotfiles/config/termite/config
sed -i -e "s/color13 .*/color13 = ${RICECLOUD_COLOR_13}/g" dotfiles/config/termite/config
sed -i -e "s/color14 .*/color14 = ${RICECLOUD_COLOR_14}/g" dotfiles/config/termite/config
sed -i -e "s/color15 .*/color15 = ${RICECLOUD_COLOR_15}/g" dotfiles/config/termite/config

# Xresources
sed -i -e "s/foreground.*/foreground: ${RICECLOUD_COLOR_FOREGROUND}/g" dotfiles/Xresources
sed -i -e "s/background.*/background: ${RICECLOUD_COLOR_BACKGROUND}/g" dotfiles/Xresources
sed -i -e "s/cursorColor.*/cursorColor: ${RICECLOUD_COLOR_CURSOR}/g" dotfiles/Xresources
sed -i -e "s/color0.*/color0: ${RICECLOUD_COLOR_0}/g" dotfiles/Xresources
sed -i -e "s/color1.*/color1: ${RICECLOUD_COLOR_1}/g" dotfiles/Xresources
sed -i -e "s/color2.*/color2: ${RICECLOUD_COLOR_2}/g" dotfiles/Xresources
sed -i -e "s/color3.*/color3: ${RICECLOUD_COLOR_3}/g" dotfiles/Xresources
sed -i -e "s/color4.*/color4: ${RICECLOUD_COLOR_4}/g" dotfiles/Xresources
sed -i -e "s/color5.*/color5: ${RICECLOUD_COLOR_5}/g" dotfiles/Xresources
sed -i -e "s/color6.*/color6: ${RICECLOUD_COLOR_6}/g" dotfiles/Xresources
sed -i -e "s/color7.*/color7: ${RICECLOUD_COLOR_7}/g" dotfiles/Xresources
sed -i -e "s/color8.*/color8: ${RICECLOUD_COLOR_8}/g" dotfiles/Xresources
sed -i -e "s/color9.*/color9: ${RICECLOUD_COLOR_9}/g" dotfiles/Xresources
sed -i -e "s/color10.*/color10: ${RICECLOUD_COLOR_10}/g" dotfiles/Xresources
sed -i -e "s/color11.*/color11: ${RICECLOUD_COLOR_11}/g" dotfiles/Xresources
sed -i -e "s/color12.*/color12: ${RICECLOUD_COLOR_12}/g" dotfiles/Xresources
sed -i -e "s/color13.*/color13: ${RICECLOUD_COLOR_13}/g" dotfiles/Xresources
sed -i -e "s/color14.*/color14: ${RICECLOUD_COLOR_14}/g" dotfiles/Xresources
sed -i -e "s/color15.*/color15: ${RICECLOUD_COLOR_15}/g" dotfiles/Xresources

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
sed -i -e "s/window.active.border.color: .*/window.active.border.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.border.color: .*/window.inactive.border.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.frameColor: .*/window.frameColor: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.*.client.color: .*/window.*.client.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/menu.border.color: .*/menu.border.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/menu.items.bg.color: .*/menu.items.bg.color: ${OPENBOX_INACTIVE}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/menu.items.active.bg.color: .*/menu.items.active.bg.color: ${OPENBOX_ACTIVE}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/menu.items.disabled.text.color: .*/menu.items.disabled.text.color: ${OPENBOX_INACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/menu.items.active.text.color: .*/menu.items.active.text.color: ${OPENBOX_ACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.title.bg.color: .*/window.active.title.bg.color: ${OPENBOX_ACTIVE}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.title.separator.color: .*/window.active.title.separator.color: ${OPENBOX_ACTIVE}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.*.bg.border.color: .*/window.active.*.bg.border.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.label.text.color: .*/window.active.label.text.color: ${OPENBOX_ACTIVE}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.button.*.image.color: .*/window.active.button.*.image.color: ${OPENBOX_ACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.button.*.bg.border.color: .*/window.active.button.*.bg.border.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.button.pressed.bg.color: .*/window.active.button.pressed.bg.color: ${OPENBOX_ACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.button.pressed.bg.border.color: .*/window.active.button.pressed.bg.border.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.button.pressed.image.color: .*/window.active.button.pressed.image.color: ${OPENBOX_ACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.button.hover.bg.color: .*/window.active.button.hover.bg.color: ${OPENBOX_ACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.button.hover.bg.border.color: .*/window.active.button.hover.bg.border.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.button.hover.image.color: .*/window.active.button.hover.image.color: ${OPENBOX_ACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.button.disabled.image.color: .*/window.active.button.disabled.image.color: ${OPENBOX_ACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.handle.bg.color: .*/window.active.handle.bg.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.active.grip.bg.color: .*/window.active.grip.bg.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.title.bg.color: .*/window.inactive.title.bg.color: ${OPENBOX_INACTIVE}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.title.separator.color: .*/window.inactive.title.separator.color: ${OPENBOX_INACTIVE}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.*.border.color: .*/window.inactive.*.border.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.label.text.color: .*/window.inactive.label.text.color: ${OPENBOX_INACTIVE}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.button.*.image.color: .*/window.inactive.button.*.image.color: ${OPENBOX_INACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.button.*.bg.border.color: .*/window.inactive.button.*.bg.border.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.button.pressed.bg.color: .*/window.inactive.button.pressed.bg.color: ${OPENBOX_INACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.button.pressed.bg.border.color: .*/window.inactive.button.pressed.bg.border.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.button.pressed.image.color: .*/window.inactive.button.pressed.image.color: ${OPENBOX_INACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.button.hover.bg.color: .*/window.inactive.button.hover.bg.color: ${OPENBOX_INACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.button.hover.bg.border.color: .*/window.inactive.button.hover.bg.border.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.button.hover.image.color: .*/window.inactive.button.hover.image.color: ${OPENBOX_INACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.button.disabled.image.color: .*/window.inactive.button.disabled.image.color: ${OPENBOX_INACTIVE_BUTTON}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.handle.bg.color: .*/window.inactive.handle.bg.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc
sed -i -e "s/window.inactive.grip.bg.color: .*/window.inactive.grip.bg.color: ${OPENBOX_BORDER}/g" dotfiles/config/openbox/theme/themerc

# rofi
# Note: rofi has two awesome bugs. First, opacity is messed up. It is
# higher opacity for the boxes. Second, the colors go ABGR instead of ARGB.
# This is a known bug, hopefully fixed soon... Once the opacity is fixed,
# replace ROFI_OPACITY in the 5 lines below with RICECLOUD_COLOR_OPACITY.
export ROFI_OPACITY=100
ROFI_BACKGROUND=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_BACKGROUND"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s".format(opacity, 2) % (color))'`
ROFI_FOREGROUND=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_HIGHLIGHT"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s".format(opacity, 2) % (color))'`
ROFI_NORMAL=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_TEXT"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s".format(opacity, 2) % (color))'`
ROFI_ACTIVE=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_ACCENT"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s".format(opacity, 2) % (color))'`
ROFI_URGENT=`python -c 'import os; color=os.environ["RICECLOUD_COLOR_WARNING"][1:]; opacity=int(float(os.environ["ROFI_OPACITY"]) * 2.55); print("#{0:0{1}x}%s".format(opacity, 2) % (color))'`
sed -i -e "s/rofi.font:.*/rofi.font: ${RICECLOUD_GUI_FONT} ${RICECLOUD_GUI_FONT_SIZE}/g" dotfiles/config/rofi/config
sed -i -e "s/rofi.color-window:.*/rofi.color-window: ${ROFI_BACKGROUND}, ${ROFI_BACKGROUND}, ${ROFI_BACKGROUND}/g" dotfiles/config/rofi/config
sed -i -e "s/rofi.color-normal:.*/rofi.color-normal: ${ROFI_BACKGROUND}, ${ROFI_NORMAL}, ${ROFI_BACKGROUND}, ${ROFI_FOREGROUND}, ${ROFI_BACKGROUND}/g" dotfiles/config/rofi/config
sed -i -e "s/rofi.color-active:.*/rofi.color-active: ${ROFI_BACKGROUND}, ${ROFI_ACTIVE}, ${ROFI_BACKGROUND}, ${ROFI_FOREGROUND}, ${ROFI_BACKGROUND}/g" dotfiles/config/rofi/config
sed -i -e "s/rofi.color-urgent:.*/rofi.color-urgent: ${ROFI_BACKGROUND}, ${ROFI_URGENT}, ${ROFI_BACKGROUND}, ${ROFI_FOREGROUND}, ${ROFI_BACKGROUND}/g" dotfiles/config/rofi/config

# oblogout
sed -i -e "s/opacity .*/opacity = ${RICECLOUD_COLOR_OPACITY}/g" dotfiles/config/oblogout/config
#sed -i -e "s/bgcolor .*/bgcolor = ${RICECLOUD_COLOR_BACKGROUND}/g" dotfiles/config/oblogout/config
sed -i -e "s/bgcolor .*/bgcolor = black/g" dotfiles/config/oblogout/config

# polybar
sed -i -e "s/font-0 = .*/font-0 = ${RICECLOUD_GUI_FONT}:pixelsize=${RICECLOUD_GUI_FONT_SIZE}\;0/g" dotfiles/config/polybar/config
sed -i -e "s/font-1 = .*/font-1 = FontAwesome:pixelsize=${RICECLOUD_GUI_FONT_SIZE}\;0/g" dotfiles/config/polybar/config
sed -i -e "s/ricecloud-background .*/ricecloud-background = #01000000/g" dotfiles/config/polybar/config
sed -i -e "s/ricecloud-foreground .*/ricecloud-foreground = ${RICECLOUD_COLOR_FOREGROUND}/g" dotfiles/config/polybar/config
sed -i -e "s/ricecloud-text .*/ricecloud-text = ${RICECLOUD_COLOR_TEXT}/g" dotfiles/config/polybar/config
sed -i -e "s/ricecloud-highlight .*/ricecloud-highlight = ${RICECLOUD_COLOR_HIGHLIGHT}/g" dotfiles/config/polybar/config
sed -i -e "s/ricecloud-accent .*/ricecloud-accent = ${RICECLOUD_COLOR_ACCENT}/g" dotfiles/config/polybar/config
sed -i -e "s/ricecloud-warning .*/ricecloud-warning = ${RICECLOUD_COLOR_WARNING}/g" dotfiles/config/polybar/config

# dunst
sed -i -e "s/font = .*/font = ${RICECLOUD_GUI_FONT} ${RICECLOUD_GUI_FONT_SIZE}/g" dotfiles/config/dunst/config
sed -i -e "s/transparency = .*/transparency = ${RICECLOUD_COLOR_TRANSPARENCY}/g" dotfiles/config/dunst/config
sed -i -e "s/frame_color = .*/frame_color = \"${RICECLOUD_COLOR_0}\"/g" dotfiles/config/dunst/config
sed -i -e "s/separator_color = .*/separator_color = \"${RICECLOUD_COLOR_0}\"/g" dotfiles/config/dunst/config
sed -i -e "/\[urgency_low\]/{n;s/background = .*/background = \"${RICECLOUD_COLOR_BACKGROUND}\"/g;n;s/foreground = .*/foreground = \"${RICECLOUD_COLOR_ACCENT}\"/g}" dotfiles/config/dunst/config
sed -i -e "/\[urgency_normal\]/{n;s/background = .*/background = \"${RICECLOUD_COLOR_BACKGROUND}\"/g;n;s/foreground = .*/foreground = \"${RICECLOUD_COLOR_TEXT}\"/g}" dotfiles/config/dunst/config
sed -i -e "/\[urgency_critical\]/{n;s/background = .*/background = \"${RICECLOUD_COLOR_BACKGROUND}\"/g;n;s/foreground = .*/foreground = \"${RICECLOUD_COLOR_WARNING}\"/g}" dotfiles/config/dunst/config

# cava
sed -i -e "s/background = .*/background = '${RICECLOUD_COLOR_BACKGROUND}'/g" dotfiles/config/cava/config
sed -i -e "s/gradient_color_1 = .*/gradient_color_1 = '${RICECLOUD_COLOR_ACCENT}'/g" dotfiles/config/cava/config
sed -i -e "s/gradient_color_2 = .*/gradient_color_2 = '${RICECLOUD_COLOR_TEXT}'/g" dotfiles/config/cava/config


