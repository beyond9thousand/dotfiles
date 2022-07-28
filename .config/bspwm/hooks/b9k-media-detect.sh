#!/bin/bash

#Script starts running
# dunstify -i text-x-script "Screensaver activated"

while true; do
	sleep 15
	ss=Paused #Initial state provided is 'Paused'
	smeta=Null
	vc=Null
	ss=$(playerctl status 2>/dev/null)            #Playerctl status is fed
	smeta=$(playerctl metadata album 2>/dev/null) #Playerctl metadata album info is fed
	vc=$(fuser /dev/video0 2>/dev/null)
	if [[ $ss = Playing && ! $smeta || $vc ]]; then
		xdg-screensaver reset
	fi
done
