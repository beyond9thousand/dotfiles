#!/bin/bash

while true; do
	sleep 15
	media_state=$(playerctl status 2>/dev/null)
	meta_data=$(playerctl metadata album 2>/dev/null)
	video_camera=$(fuser /dev/video0 2>/dev/null)

	if [[ $media_state = Playing && ! $meta_data || $video_camera ]]; then
		xdg-screensaver reset
	fi
done
