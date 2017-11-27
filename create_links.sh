#!/bin/bash

export RICECLOUD_PATH=$HOME/development/ricecloud/dotfiles/config

ln -s $RICECLOUD_PATH/openbox/autostart $HOME/.config/openbox/autostart
ln -s $RICECLOUD_PATH/openbox/environment $HOME/.config/openbox/environment
ln -s $RICECLOUD_PATH/openbox/menu.xml $HOME/.config/openbox/menu.xml
ln -s $RICECLOUD_PATH/openbox/rc.xml $HOME/.config/openbox/rc.xml

ln -s $RICECLOUD_PATH/compton/config $HOME/.config/compton/config

ln -s $RICECLOUD_PATH/dunst/config $HOME/.config/dunst/config

#ln -s $RICECLOUD_PATH/ranger/rifle.conf $HOME/.config/ranger/rifle.conf
#ln -s $RICECLOUD_PATH/ranger/commands.py $HOME/.config/ranger/commands.py
#ln -s $RICECLOUD_PATH/ranger/commands_full.py $HOME/.config/ranger/commands_full.py
#ln -s $RICECLOUD_PATH/ranger/rc.conf $HOME/.config/ranger/rc.conf
#ln -s $RICECLOUD_PATH/ranger/scope.sh $HOME/.config/ranger/scope.sh

ln -s $RICECLOUD_PATH/rofi/config $HOME/.config/rofi/config
ln -s $RICECLOUD_PATH/rofi/launch.sh $HOME/.config/rofi/launch.sh
chmod +x $HOME/.config/rofi/launch.sh

ln -s $RICECLOUD_PATH/polybar/config $HOME/.config/polybar/config

ln -s $RICECLOUD_PATH/termite/config $HOME/.config/termite/config

ln -s $RICECLOUD_PATH/gtk-3.0/gtk.css $HOME/.config/gtk-3.0/gtk.css

