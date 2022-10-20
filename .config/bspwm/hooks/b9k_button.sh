#!/bin/bash

STYLUS="$(xsetwacom --list devices | grep -w "STYLUS" | awk -F '  \t' '{print$1}')"
SWITCH="false"
declare -a _apps=(PureRef Blender)

_xmod() {
	xmodmap -e "pointer = 1 $1 3 4 5 6 7 8 $2 10" &
	xsetwacom set "$STYLUS" Button "$3" "$4" &
	SWITCH="$5"
}

bspc subscribe node_focus | while read -r _ _ _ node_id; do
	for index in "${_apps[@]}"; do
		if xtitle "$node_id" | grep -w "$index"; then
			_xmod "9" "2" "2" "9" "$index"
      break
		else
			if [[ $SWITCH == "$index" ]]; then
				_xmod "2" "9" "2" "2" "false"
			fi
		fi
	done
done
