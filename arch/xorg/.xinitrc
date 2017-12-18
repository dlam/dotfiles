#! /bin/bash

xset m 1/1
xset r rate 170 50
xrdb "$HOME/.Xresources"
~/.fehbg &

exec i3
