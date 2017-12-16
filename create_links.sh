#!/bin/bash

export RICECLOUD_ROOT=$HOME/development/ricecloud/dotfiles
export RICECLOUD_CONFIG=$RICECLOUD_ROOT/config

ln -s $RICECLOUD_ROOT/vimrc $HOME/.vimrc
ln -s $RICECLOUD_ROOT/Xresources $HOME/.Xresources

mkdir $HOME/.themes
mkdir $HOME/.themes/ricecloud
ln -s $RICECLOUD_CONFIG/openbox/theme $HOME/.themes/ricecloud/openbox-3
ln -s $RICECLOUD_CONFIG/oblogout/theme $HOME/.themes/ricecloud/oblogout

mkdir $HOME/.config/openbox
ln -s $RICECLOUD_CONFIG/openbox/autostart $HOME/.config/openbox/autostart
ln -s $RICECLOUD_CONFIG/openbox/environment $HOME/.config/openbox/environment
ln -s $RICECLOUD_CONFIG/openbox/menu.xml $HOME/.config/openbox/menu.xml
ln -s $RICECLOUD_CONFIG/openbox/rc.xml $HOME/.config/openbox/rc.xml

mkdir $HOME/.config/compton
ln -s $RICECLOUD_CONFIG/compton/config $HOME/.config/compton/config

mkdir $HOME/.config/dunst
ln -s $RICECLOUD_CONFIG/dunst/config $HOME/.config/dunst/config

mkdir $HOME/.config/ranger
#ln -s $RICECLOUD_CONFIG/ranger/rifle.conf $HOME/.config/ranger/rifle.conf
#ln -s $RICECLOUD_CONFIG/ranger/commands.py $HOME/.config/ranger/commands.py
#ln -s $RICECLOUD_CONFIG/ranger/commands_full.py $HOME/.config/ranger/commands_full.py
#ln -s $RICECLOUD_CONFIG/ranger/rc.conf $HOME/.config/ranger/rc.conf
#ln -s $RICECLOUD_CONFIG/ranger/scope.sh $HOME/.config/ranger/scope.sh

mkdir $HOME/.config/rofi
ln -s $RICECLOUD_CONFIG/rofi/config $HOME/.config/rofi/config
ln -s $RICECLOUD_CONFIG/rofi/launch.sh $HOME/.config/rofi/launch.sh
chmod +x $HOME/.config/rofi/launch.sh

mkdir $HOME/.config/oblogout
ln -s $RICECLOUD_CONFIG/oblogout/config $HOME/.config/oblogout/config
ln -s $RICECLOUD_CONFIG/oblogout/launch.sh $HOME/.config/oblogout/launch.sh
chmod +x $HOME/.config/oblogout/launch.sh

mkdir $HOME/.config/polybar
ln -s $RICECLOUD_CONFIG/polybar/config $HOME/.config/polybar/config

mkdir $HOME/.config/termite
ln -s $RICECLOUD_CONFIG/termite/config $HOME/.config/termite/config

mkdir $HOME/.config/gtk-3.0
ln -s $RICECLOUD_CONFIG/gtk-3.0/gtk.css $HOME/.config/gtk-3.0/gtk.css

mkdir $HOME/.config/cava
ln -s $RICECLOUD_CONFIG/cava/config $HOME/.config/cava/config

