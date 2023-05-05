#!/bin/bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload primary_monitor &
  done
else
  polybar --reload primary_monitor &
fi

polybar left --config=$HOME/.config/polybar/config.ini &
polybar center --config=$HOME/.config/polybar/config.ini &
polybar right --config=$HOME/.config/polybar/config.ini &
polybar secondary_left --config=$HOME/.config/polybar/config.ini &
polybar secondary_center --config=$HOME/.config/polybar/config.ini &
polybar secondary_right --config=$HOME/.config/polybar/config.ini 
