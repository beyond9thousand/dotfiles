#!/bin/bash

#                __             __             __
#   ____ ___  __/ /_____  _____/ /_____ ______/ /_
#  / __ `/ / / / __/ __ \/ ___/ __/ __ `/ ___/ __/
# / /_/ / /_/ / /_/ /_/ (__  ) /_/ /_/ / /  / /_
# \__,_/\__,_/\__/\____/____/\__/\__,_/_/   \__/
#

# Restart default apps
declare -a restart=(xfce4-power-manager picom sxhkd xbanish
	copyq playerctld plank flameshot touchegg dunst)
for i in "${restart[@]}"; do
	pgrep -x "$i" | xargs kill
  sleep 0.5
	eval "$i" &
done

# Exclusive apps
if [[ ! $(pidof stalonetray) ]]; then
	stalonetray &
  sleep 0.5
	xdo hide -N stalonetray
	touch "/tmp/syshide.lock"
fi

pgrep -x "eww" | xargs kill;
control_box -ewwopen

dunstify -i window_list "BSPWM" "Completed autostarting all apps"
