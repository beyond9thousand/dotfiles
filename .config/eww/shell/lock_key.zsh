#!/usr/bin/env zsh

_sound="/usr/share/sounds/Pop/stereo/notification"
_count=0

xkb -s1 | while read _ caps_lock num_lock; do
    old_val=$num_lock
    if [[ $num_lock == "off" && $old_val != $new_val ]]; then
        new_val=$old_val
        dunstify -r 696 -t 5000 -u critical "Report" "Numlock was turned OFF"
    elif [[ $num_lock == "on" ]]; then
        new_val=$old_val
        dunstify -C 696
    fi
    echo "{\"caps_lock\":\"$caps_lock\",\"num_lock\":\"$num_lock\"}"
    if [[ $_count != 0 ]]; then
        if [[ $caps_lock == "on" || $num_lock == "off" ]]; then
            paplay $_sound/device-added.oga &
        else
            paplay $_sound/device-removed.oga &
        fi
    fi
    _count=1
done
