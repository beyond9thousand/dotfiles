#!/bin/bash

while true; do
	_vid_cam=$(lsof /dev/video0 | awk 'FNR == 4 {print}')
	media_state=$(playerctl status 2>/dev/null)
	meta_data=$(playerctl metadata album 2>/dev/null)
	# xprintidle
	# echo "$_vid_cam"
	sleep 15
	if [[ $media_state = Playing && ! $meta_data || $_vid_cam ]]; then
		# echo "in use"
		xdg-screensaver reset
	fi
done
