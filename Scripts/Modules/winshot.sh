#!/usr/bin/env bash

dunstify -u low --replace=69 -i /usr/share/icons/Papirus-Dark/symbolic/devices/camera-photo-symbolic.svg "Window Screenshot initiated"

maim -u -f png -s -b 2 -c 0.35,0.55,0.85,0.25 -l | xclip -selection clipboard -t image/png
