#!/bin/sh

xset m 1/1
xinput list | grep -oP "DeathAdder.*id=\K([0-9]+).*pointer.*" | grep -oP "\K^([0-9]+)" | xargs -I "%" xinput set-prop "%" "Coordinate Transformation Matrix" 0.3, 0, 0, 0, 0.3, 0, 0, 0, 1
xset r rate 160 50

xrdb "$HOME/.Xresources"
feh --randomize --bg-scale ~/.wallpaper/*

export DESKTOP_SESSION=cinnamon
exec i3
