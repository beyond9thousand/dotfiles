#!/usr/bin/env zsh

_sound="/usr/share/sounds/Pop/stereo/notification"
_count=0
_print(){
    echo "{\"caps_lock\":\"$CAPS\",\"num_lock\":\"$NUM\"}"
}

xkb -s1 | while read _ CAPS NUM; do
    num_old=$NUM
    caps_old=$CAPS


    if [[ $num_old != $num_new || $caps_old != $caps_new ]]; then
        num_new=$num_old
        caps_new=$caps_old

        _print

        if [[ $_count != 0 ]]; then
            if [[ $NUM == "off" ]]; then
                dunstify -r 696 -t 5000 -u critical "Report" "Numlock was turned OFF"
            else
                dunstify -C 696
            fi

            if [[ $CAPS == "on" || $NUM == "off" ]]; then
                paplay $_sound/device-added.oga &
            else
                paplay $_sound/device-removed.oga &
            fi
        fi
    fi

    _count=1
done
