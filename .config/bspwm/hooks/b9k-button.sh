#!/bin/bash

bspc subscribe node_focus | while read -r _ _ _ node_id;
do
  blend=$(xtitle $node_id | grep Blender)
  if [[ $blend != "" ]]; then
    xmodmap -e 'pointer = 1 9 3 4 5 6 7 8 2 10' &
  else
    xmodmap -e 'pointer = 1 2 3 4 5 6 7 8 9 10' &
  fi
done


