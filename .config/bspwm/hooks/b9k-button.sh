#!/bin/bash

stylus="Wacom Intuos PT M 2 Pen stylus"

bspc subscribe node_focus | while read -r _ _ _ node_id; do
  if xtitle "$node_id" | grep Blender; then
    xmodmap -e 'pointer = 1 9 3 4 5 6 7 8 2 10' &
    xsetwacom set "$stylus" Button 2 9 &
  else
    xmodmap -e 'pointer = 1 2 3 4 5 6 7 8 9 10' &
    xsetwacom set "$stylus" Button 2 2 &
  fi
done
