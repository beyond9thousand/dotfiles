#!/bin/bash

dimtime=120000
offtime=300000
warntime=270000
idle=false
stage1=false
stage2=false

while true; do
	idletime=$(xprintidle)
	# echo "$idletime"  # just for debug purposes.
	if [[ $idle = false && $idletime -gt $dimtime ]]; then
		msi-perkeyrgb -s 000000
		og=$(xbacklight -get)
		xbacklight -set 5
		idle=true
		stage1=true
	fi

	if [[ $stage1 = true && $idle = true && $idletime -gt $warntime ]]; then
		pkill -9 -f "dunst"
		dunstify -i screensaver "Screensaver" "Screen will turn off in 30 seconds"
		stage1=false
		stage2=true
	fi

	if [[ $stage2 = true && $idle = true && $idletime -gt $offtime ]]; then
		xbacklight -set 0
		stage2=false
	fi

	if [[ $idle = true && $idletime -lt $dimtime ]]; then
		msi-perkeyrgb -s aa0000
		xbacklight -set "$og"
		idle=false
	fi
	sleep 1 # polling interval

done
