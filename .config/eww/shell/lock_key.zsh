#!/usr/bin/env zsh

xkb -s1 | while read _ caps_lock num_lock; do
    if [[ $num_lock == "off" ]]; then
        dunstify -r 696 -t 5000 -u critical "Report" "Numlock was turned OFF"
    else
        dunstify -C 696
    fi
    echo "{\"caps_lock\":\"$caps_lock\",\"num_lock\":\"$num_lock\"}"
done
