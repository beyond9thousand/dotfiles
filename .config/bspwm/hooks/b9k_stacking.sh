#!/bin/bash

declare -a _role=("pop-up" "PictureInPicture")
declare -a _DND=("is sharing your screen.")

_PIP() {
	xprop WM_WINDOW_ROLE -id "$node_id"
}

_HIDE() {
	xprop WM_NAME -id "$node_id"
}

bspc subscribe node_add | while read -r _ _ _ _ node_id; do
	xdo raise -N Plank

	for index in "${_DND[@]}"; do
		if _HIDE | grep "$index"; then
			xdo hide "$node_id"
		fi
	done

	for index in "${_role[@]}"; do
		if _PIP | grep "$index"; then
			bspc node "$node_id" --state floating --flag sticky=on
			if [[ $index == "pop-up" ]]; then
				xdotool windowsize "$node_id" 770 225
			fi
		fi
	done
done
