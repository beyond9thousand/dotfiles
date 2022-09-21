#!/bin/bash

stylus="$(xsetwacom --list devices | grep -w "STYLUS" | awk -F '  \t' '{print$1}')"
toggled="false"

bspc subscribe node_focus | while read -r _ _ _ node_id; do
	if xtitle "$node_id" | grep -w "Blender"; then
		xmodmap -e 'pointer = 1 9 3 4 5 6 7 8 2 10' &
		xsetwacom set "$stylus" Button 2 9 &
		toggled="true"
	else
		if [[ $toggled == "true" ]]; then
			xmodmap -e 'pointer = 1 2 3 4 5 6 7 8 9 10' &
			xsetwacom set "$stylus" Button 2 2 &
			toggled="false"
		fi
	fi
done
