#! /bin/bash
xset m 1/1
xrdb "$HOME/.Xresources"
sh ~/.fehbg &
exec i3
