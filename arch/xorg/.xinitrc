#! /bin/bash

xset m 1/1
xset r rate 170 50
xinput list | grep -oP "DeathAdder.*id=\K([0-9]+).*pointer.*" | grep -oP "\K^([0-9]+)" | xargs -I "%" xinput set-prop "%" "Coordinate Transformation Matrix" 0.3, 0, 0, 0, 0.3, 0, 0, 0, 1
xrdb "$HOME/.Xresources"
~/.fehbg &

# xrandr --output eDP-1 --dpi 192
xrandr --output eDP-1 --off
exec i3
